-- lsp specific keybinds now live in lua/govi/remap.lua

local function get_intelephense_license()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'j-hui/fidget.nvim', -- bottom right messages
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = {behaviour = cmp.SelectBehavior.Select}
            local cmp_nvim_lsp = require('cmp_nvim_lsp')

            require('fidget').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "cssls", -- css, scss and less
                    "pyright", -- most python language features
                    "ruff", -- python linting and formatting
                    "rust_analyzer",
                    "ts_ls", -- typescript
                    "marksman", -- markdown
                    "jsonls", -- json
                    "gopls", -- go
                    "intelephense", -- php
                },
                handlers = {
                    function(server_name) -- default handler
                        local capabilities = vim.tbl_deep_extend(
                            "force",
                            {},
                            vim.lsp.protocol.make_client_capabilities(),
                            cmp_nvim_lsp.default_capabilities()
                        )
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function ()
                        local lspconfig = require('lspconfig')
                        lspconfig.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        -- recognise the `vim` global
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        -- awareness of neovim runtime files
                                        library = {
                                            vim.api.nvim_get_runtime_file("", true)
                                        }
                                    },
                                    telemetry = {
                                        enable = false,
                                    },
                                }
                            }
                        })
                    end,
                    ["intelephense"] = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.intelephense.setup({
                            settings = {
                                intelephense = {
                                    licenceKey = get_intelephense_license(),
                                    stubs = {
                                        "apache",
                                        "bcmath",
                                        "bz2",
                                        "calendar",
                                        "com_dotnet",
                                        "Core",
                                        "ctype",
                                        "curl",
                                        "date",
                                        "dba",
                                        "dom",
                                        "enchant",
                                        "exif",
                                        "FFI",
                                        "fileinfo",
                                        "filter",
                                        "fpm",
                                        "ftp",
                                        "gd",
                                        "gettext",
                                        "gmp",
                                        "hash",
                                        "iconv",
                                        "imap",
                                        "intl",
                                        "json",
                                        "ldap",
                                        "libxml",
                                        "mbstring",
                                        "meta",
                                        "mysqli",
                                        "oci8",
                                        "odbc",
                                        "openssl",
                                        "pcntl",
                                        "pcre",
                                        "PDO",
                                        "pdo_ibm",
                                        "pdo_mysql",
                                        "pdo_pgsql",
                                        "pdo_sqlite",
                                        "pgsql",
                                        "Phar",
                                        "posix",
                                        "pspell",
                                        "random",
                                        "readline",
                                        "Reflection",
                                        "session",
                                        "shmop",
                                        "SimpleXML",
                                        "snmp",
                                        "soap",
                                        "sockets",
                                        "sodium",
                                        "SPL",
                                        "sqlite3",
                                        "standard",
                                        "superglobals",
                                        "sysvmsg",
                                        "sysvsem",
                                        "sysvshm",
                                        "tidy",
                                        "tokenizer",
                                        "xml",
                                        "xmlreader",
                                        "xmlrpc",
                                        "xmlwriter",
                                        "xsl",
                                        "Zend OPcache",
                                        "zip",
                                        "zlib",
                                        "wordpress",
                                        "wordpress-globals",
                                        "woocommerce",
                                        "acf-pro",
                                        "wp-cli",
                                        "genesis",
                                        "polylang",
                                    }
                                }
                            }
                        })
                    end,
                    ["denols"] = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.denols.setup({
                            root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc')
                        })
                    end,
                    ["ts_ls"] = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.ts_ls.setup({
                            root_dir = lspconfig.util.root_pattern('package.json'),
                            single_file_support = false,
                        })
                    end,
                    ["pyright"] = function()
                        local lspconfig = require('lspconfig')
                        -- disable linting, formatting and organising imports in pyright
                        lspconfig.pyright.setup({
                            settings = {
                                pyright = {
                                    -- using ruff's import organiser
                                    disableOrganizeImports = true,
                                },
                                python = {
                                    analysis = {
                                        -- Ignore all files for analysis to exclusively use ruff for linting
                                        ignore = { '*' },
                                    }
                                }
                            }
                        })
                    end,
                }
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- go to previous suggestion
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- go to next suggestion
                    ['<C-y>'] = cmp.mapping.confirm({select = true}), -- accept suggestion
                    ['<C-Space>'] = cmp.mapping.complete(), -- This seems to just be outputting the word "complete"
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
}

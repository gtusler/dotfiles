-- lsp specific keybinds now live in lua/govi/remap.lua

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
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = {behaviour = cmp.SelectBehavior.Select}
            local cmp_nvim_lsp = require('cmp_nvim_lsp')

            require('fidget').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "tsserver"
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
                                        globals = { "vim" },
                                    }
                                }
                            }
                        })
                    end,
                    ["intelephense"] = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.intelephense.setup({
                            settings = {
                                intelephense = {
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


            local null_ls = require('null-ls')
            local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
            local event = "BufWritePre" -- or "BufWritePost"
            local async = event == "BufWritePost"

            null_ls.setup({
              on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                  vim.keymap.set("n", "<Leader>f", function()
                    vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                  end, { buffer = bufnr, desc = "[lsp] format" })

                  -- format on save
                  vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                  vim.api.nvim_create_autocmd(event, {
                    buffer = bufnr,
                    group = group,
                    callback = function()
                      vim.lsp.buf.format({ bufnr = bufnr, async = async })
                    end,
                    desc = "[lsp] format on save",
                  })
                end

                if client.supports_method("textDocument/rangeFormatting") then
                  vim.keymap.set("x", "<Leader>f", function()
                    vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                  end, { buffer = bufnr, desc = "[lsp] format" })
                end
              end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
}

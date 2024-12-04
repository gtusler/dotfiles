local prettier_file_types = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
}

local null_ls_file_types = {
    "elm",
}

return {
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require('null-ls')
            local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
            local event = "BufWritePre" -- or "BufWritePost"
            local async = event == "BufWritePost"
            -- print("null_ls config")

            null_ls.setup({
                on_attach = function(client, bufnr)
                    print("null_ls attach")
                    print("why no attachhhhhhh")
                    if client.supports_method("textDocument/formatting") then
                        vim.keymap.set(
                            "n",
                            "<leader>f",
                            function()
                                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                            end,
                            { buffer = bufnr, desc = "[lsp] format" }
                        )

                        -- format on save
                        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                        vim.api.nvim_create_autocmd(
                            event,
                            {
                                buffer = bufnr,
                                group = group,
                                callback = function()
                                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                                end,
                                desc = "[lsp] format on save",
                            }
                        )
                    end

                    if client.supports_method("textDocument/rangeFormatting") then
                        vim.keymap.set(
                            "x",
                            "<leader>f",
                            function()
                                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                            end,
                            { buffer = bufnr, desc = "[lsp] format" }
                        )
                    end
                end,
            })
        end,
        ft = null_ls_file_types
    },
    {
        'MunifTanjim/prettier.nvim',
        dependencies = {
            'nvimtools/none-ls.nvim',
        },
        config = function()
            local prettier = require('prettier')
            prettier.setup({
                bin = 'prettier',
                filetypes = prettier_file_types
            })
        end,
        ft = prettier_file_types,
    },
    {
        -- This might be worth installing at some point.
        -- https://github.com/WordPress/WordPress-Coding-Standards?tab=readme-ov-file#installation
        dir = '~/dev/nvim-plugins/phpcs.nvim',
        config = function()
            require('phpcs').setup({
                phpcs = '/usr/local/bin/phpcs',
                phpcbf = '/usr/local/bin/phpcbf',
                standard = 'auto',
                standard_fallback = 'PSR2',
                fix_on_save = false,
            })
        end,
    }
}

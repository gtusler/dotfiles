return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        local telescope = require('telescope')

        telescope.setup({
            extensions = {
                fzf = {},
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({})
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files in cwd" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in git" })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "Find text in nvim help" })

        vim.keymap.set('n', '<leader>pg', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end, { desc = "Grep in cwd for the input string" })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Find files in cwd containing the current w" })
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Find files in cwd containing the current W" })

        vim.keymap.set('n', '<leader>pc', function()
            builtin.find_files({ cwd = vim.fn.stdpath "config" })
        end, { desc = "Find files in neovim config" })

        telescope.load_extension("ui-select")
        telescope.load_extension("fzf")
    end,
}

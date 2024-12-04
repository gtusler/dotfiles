return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>')
        vim.keymap.set('n', '<leader>gdv', '<cmd>Gvdiffsplit<CR>')
        vim.keymap.set('n', '<leader>gdh', '<cmd>Ghdiffsplit<CR>')
    end,
}

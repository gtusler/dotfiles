return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                -- 'help',
                'javascript',
                'typescript',
                -- 'c',
                'lua',
                'vim',
                'query',
            },
            sync_install = false,
            auto_install = true,
            ignore_install = { 'javascript' },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}

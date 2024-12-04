-- Everything to do with comments is in this file.

return {
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {}
    },
}

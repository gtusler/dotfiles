return {
    'meznaric/key-analyzer.nvim',
    config = function()
        require('key-analyzer').setup({
            command_name = "KeyAnalyzer",
        })
    end,
}

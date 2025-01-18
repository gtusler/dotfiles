return {
	"L3MON4D3/LuaSnip",
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	build = "make install_jsregexp", -- optional
    dependencies = {
        'rafamadriz/friendly-snippets',
        "benfowler/telescope-luasnip.nvim",
    },
    config = function ()
        require('luasnip.loaders.from_vscode').lazy_load()

        -- experimental
        local luasnip = require('luasnip');
        luasnip.filetype_extend('php', {'phpdoc'})
    end
}

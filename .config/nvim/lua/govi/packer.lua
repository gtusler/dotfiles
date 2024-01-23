
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'EdenEast/nightfox.nvim'
    use { "ellisonleao/gruvbox.nvim" }

    -- use 'HiPhish/nvim-ts-rainbow-2' -- https://github.com/HiPhish/nvim-ts-rainbow2
    use 'airblade/vim-gitgutter'
    use 'j-hui/fidget.nvim'
    use 'nanozuki/tabby.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'simrat39/symbols-outline.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                          , branch = '0.1.x'
        requires = { {'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('terrortylor/nvim-comment')
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support

    -- ai completion
    use { 'codota/tabnine-nvim', run = './dl_binaries.sh' }

    -- prettier code formatting
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- lsp-zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},              -- Required
            {'williamboman/mason.nvim'},            -- Optional
            {'williamboman/mason-lspconfig.nvim'},  -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},                   -- Required
            {'hrsh7th/cmp-nvim-lsp'},               -- Required
            {'hrsh7th/cmp-buffer'},                 -- Optional
            {'hrsh7th/cmp-path'},                   -- Optional
            {'saadparwaiz1/cmp_luasnip'},           -- Optional
            {'hrsh7th/cmp-nvim-lua'},               -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},                   -- Required
            {'rafamadriz/friendly-snippets'},       -- Optional
        }
    }
end)


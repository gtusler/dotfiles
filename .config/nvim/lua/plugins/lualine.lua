return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                -- theme = 'auto',
                -- theme = 'onedark',
                theme = 'codedark',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    'mode',
                    function(str)
                        return str:sub(1, 1)
                    end
                },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    { -- https://github.com/nvim-lualine/lualine.nvim#filename-component-options
                        'filename',
                        file_status = true, -- (readonly, modified)
                        path = 1,
                    }
                },
                lualine_x = {
                    -- 'tabnine',
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'filesize' },
                lualine_z = { 'progress', 'location' }
            },
            inactive_sections = {
                lualine_a = { 'diff' },
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}

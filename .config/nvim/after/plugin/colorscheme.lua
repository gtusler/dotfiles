function ColorMyPencilsGruvbox(color)
    require('gruvbox').setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = false,
            operators = false,
            comments = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be 'hard', 'soft' or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })

    color = color or 'gruvbox'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

function ColorMyPencils(color)
    -- local carbonfox = require('nightfox.palette').load('nightfox')

    require('nightfox').setup({
        options = {
            -- Compiled file's destination location
            -- compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            -- compile_file_suffix = "_compiled", -- Compiled file suffix
            transparent = false,     -- Disable setting background
            terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = true,    -- Non focused panes set to alternative background
            module_default = true,   -- Default enable value for modules
            colorblind = {
                enable = false,        -- Enable colorblind support
                simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                severity = {
                    protan = 0,          -- Severity [0,1] for protan (red)
                    deutan = 0,          -- Severity [0,1] for deutan (green)
                    tritan = 0,          -- Severity [0,1] for tritan (blue)
                },
            },
            styles = {               -- Style to be applied to different syntax groups
                comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
                conditionals = "NONE",
                constants = "NONE",
                functions = "NONE",
                keywords = "bold",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                -- types = "italic,bold",
                types = "bold",
                variables = "NONE",
            },
            inverse = {             -- Inverse highlight for different types
                match_paren = true,
                visual = false,
                search = true,
            },
            modules = {             -- List of various plugins and additional options
                -- ...
            },
        },
        palettes = {},
        specs = {},
        groups = {},
    })

    -- print(vim.inspect(carbonfox))
    -- color = color or 'nightfox'
    color = color or 'carbonfox'
    -- color = color or 'nordfox'
    vim.cmd('colorscheme ' .. color)
end

ColorMyPencils()


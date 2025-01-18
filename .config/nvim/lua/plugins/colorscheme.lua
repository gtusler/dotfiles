-- return {
--     'EdenEast/nightfox.nvim',
--     config = function()
--         require('nightfox').setup({
--             options = {
--                 transparent = false,     -- Disable setting background
--                 terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--                 dim_inactive = true,    -- Non focused panes set to alternative background
--                 module_default = true,   -- Default enable value for modules
--                 colorblind = {
--                     enable = false,        -- Enable colorblind support
--                     simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
--                     severity = {
--                         protan = 0,          -- Severity [0,1] for protan (red)
--                         deutan = 0,          -- Severity [0,1] for deutan (green)
--                         tritan = 0,          -- Severity [0,1] for tritan (blue)
--                     },
--                 },
--                 styles = {               -- Style to be applied to different syntax groups
--                     comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
--                     conditionals = "NONE",
--                     constants = "NONE",
--                     functions = "NONE",
--                     keywords = "bold",
--                     numbers = "NONE",
--                     operators = "NONE",
--                     strings = "NONE",
--                     -- types = "italic,bold",
--                     types = "bold",
--                     variables = "NONE",
--                 },
--                 inverse = {             -- Inverse highlight for different types
--                     match_paren = false,
--                     visual = false,
--                     search = true,
--                 },
--                 modules = {             -- List of various plugins and additional options
--                     -- ...
--                 },
--             },
--             palettes = {},
--             specs = {},
--             groups = {},
--         })
--
--         -- print(vim.inspect(carbonfox))
--         -- color = color or 'nightfox'
--         color = color or 'carbonfox'
--         -- color = color or 'nordfox'
--         vim.cmd('colorscheme ' .. color)
--     end,
-- }

return {
    'ficcdaf/ashen.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd('colorscheme ashen')
    end
}

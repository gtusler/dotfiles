--vim.opt.guicursor = "" -- keep phat cursor in insert mode

-- line numbers
vim.o.number = true         -- enable line number
vim.o.relativenumber = true -- and relative line numbers

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4   -- number of spaces to use for each step of indent
vim.opt.expandtab = true
vim.o.autoindent = true  -- uses the indentation from the previous line
vim.o.smartindent = true -- auto-indenting when starting a new line

vim.opt.wrap = true -- wrap long lines?

-- internals
vim.opt.updatetime = 50  -- how long to wait before writing swapfile
vim.opt.swapfile = false -- whether to use a swapfile
vim.opt.backup = false   -- make a backup before writing a file
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.termguicolors = true -- enable rgb colors

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8 -- maintain this many rows at the top and bottom while scrolling
vim.opt.signcolumn = 'yes' -- always show sign column (left of line numbers)
vim.opt.isfname:append('@-@')

vim.opt.colorcolumn = '120' -- choose a column to highlight
vim.opt.cursorline = true   -- whether to highlight the row the cursor is on (not sure about this)
vim.opt.cursorlineopt = "number" -- :help cursorlineopt
vim.opt.cursorcolumn = false -- whether to highlight the column the cursor is on (probably not)

-- completion menus
vim.opt.pumblend = 10 -- how much to transparentize
vim.opt.pumheight = 15 -- max rows

-- some netrw things
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

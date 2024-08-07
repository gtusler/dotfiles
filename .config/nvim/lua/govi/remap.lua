vim.g.mapleader = " "

-- this isn't working at the moment. no idea why
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- quick open netrw

-- move selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- delete a word using backspace
vim.keymap.set('n', '<C-BS>', 'diw')
vim.keymap.set('n', '<leader><C-BS>', '"_diw') -- into void register

-- append next line to this one, separated by space, persisting cursor position
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep cursor in the middle while doing half page jump
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- keep search terms in the middle while navigating
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- paste over new selection without losing initial selection. utilises "void" register
vim.keymap.set('x', '<leader>p', '"_dP')

-- delete into void register (don't copy)
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y')

-- capital Q is the worst place in the universe
vim.keymap.set('n', 'Q', '<nop>')

-- replace the word you're on
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- make the current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })



---- everything above this line is from prime, everything below is me


-- an alias to make it more convenient to replace <leader>, <C-w> etc with executable text
local function strip_term(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function send_keys(str)
    vim.api.nvim_feedkeys(strip_term(str), 'n', false)
end


-- split windows + switch
local function do_vertical_split()
    vim.cmd('vs')
    vim.api.nvim_feedkeys(strip_term('<C-w>l'), 'n', false)
end

local function do_horizontal_split()
    vim.cmd('split')
    vim.api.nvim_feedkeys(strip_term('<C-w>j'), 'n', false)
end

vim.api.nvim_create_user_command('VerticalSplit', do_vertical_split, {})
vim.api.nvim_create_user_command('HorizontalSplit', do_horizontal_split, {})

vim.keymap.set('n', '<C-Bslash>', function() vim.cmd('VerticalSplit') end)
vim.keymap.set('n', '<leader>vs', function() vim.cmd('VerticalSplit') end)
vim.keymap.set('n', '<leader>hs', function() vim.cmd('HorizontalSplit') end)



-- delete words forwards and backwards with alt
vim.keymap.set('i', '<M-Del>', '<C-[><C-[>ldwi')
vim.keymap.set('i', '<M-BS>', '<C-[><C-[>ldbi')
vim.keymap.set('n', '<M-Del>', 'dw')


-- -- move right by word using alt
vim.keymap.set('i', '<M-l>', '<C-[><C-[>lwi')
vim.keymap.set('i', '<M-Right>', '<C-[><C-[>lwi')
vim.keymap.set('n', '<M-l>', 'w')
vim.keymap.set('n', '<M-Right>', 'w')
vim.keymap.set('v', '<M-l>', 'w')
vim.keymap.set('v', '<M-Right>', 'w')

-- move left by word using alt
vim.keymap.set('i', '<M-h>', '<C-[><C-[>bi')
vim.keymap.set('i', '<M-Left>', function() send_keys('<C-[><C-[>lbi') end)
vim.keymap.set('n', '<M-h>', 'b')
vim.keymap.set('n', '<M-Left>', 'b')
vim.keymap.set('v', '<M-h>', 'b')
vim.keymap.set('v', '<M-Left>', 'b')

-- navigation
vim.keymap.set('n', "L", "<cmd>bnext<cr>")
vim.keymap.set('n', "H", "<cmd>bprevious<cr>")
vim.keymap.set('n', "F", "<cmd>HopPattern<cr>")


-- place a semicolon at the end of the line, would be nice if it reset cursor position
vim.keymap.set('i', '<C-;>', '<C-[><End>i')
vim.keymap.set('n', '<C-;>', '<End>a;<C-[>')

-- paste from clipboard in normal mode
vim.keymap.set('n', '<C-v>', function() send_keys('ip<C-[>') end)


-- copy the whole file to the clipboard

-- if i use rust tools, i can do things like <leader>rj to combine lines
-- https://github.com/simrat39/rust-tools.nvim


-- autocommand for elm format, i wish
-- need to run a command line thing but nvim has its own things called commandline
-- great.
-- local elmfmt_group= vim.api.nvim_create_augroup( "Elm Format", {clear=true} )
-- vim.api.nvim_create_autocmd({"BufWritePost"},
--     { pattern = {"*.elm"},
--     })
--
-- local function do_elm_format()
--     -- elm-format --yes elm/
-- end
-- vim.api.nvim_create_user_command('ElmFormat', do_elm_format, {})
-- vim.exec


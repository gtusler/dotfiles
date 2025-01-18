vim.g.mapleader = ' '

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'quick open netrw' })
vim.keymap.set('n', '<leader>pv', "<cmd>Oil<cr>", { desc = 'quick open oil' })
vim.keymap.set('n', '-', "<cmd>Oil<cr>", { desc = 'quick open oil' })

-- move selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move selected line up' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

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

-- replace the word you're on across the whole file
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

vim.keymap.set('n', '<leader>vs', function() vim.cmd('VerticalSplit') end)
vim.keymap.set('n', '<leader>hs', function() vim.cmd('HorizontalSplit') end)


-- -- -- move right by word using alt
-- -- vim.keymap.set('i', '<M-l>', '<C-[><C-[>lwi') -- in insert mode, this nudges one char by defaultl
-- -- vim.keymap.set('i', '<M-Right>', '<C-[><C-[>lwi')
-- vim.keymap.set('n', '<M-l>', 'w')
-- vim.keymap.set('n', '<M-Right>', 'w')
-- vim.keymap.set('v', '<M-l>', 'w')
-- vim.keymap.set('v', '<M-Right>', 'w')
--
-- -- move left by word using alt
-- vim.keymap.set('i', '<M-h>', '<C-[><C-[>bi')
-- vim.keymap.set('i', '<M-Left>', function() send_keys('<C-[><C-[>lbi') end)
-- vim.keymap.set('n', '<M-h>', 'b')
-- vim.keymap.set('n', '<M-Left>', 'b')
-- vim.keymap.set('v', '<M-h>', 'b')
-- vim.keymap.set('v', '<M-Left>', 'b')

-- navigation
vim.keymap.set('n', "L", "<cmd>bnext<cr>")
vim.keymap.set('n', "H", "<cmd>bprevious<cr>")
-- vim.keymap.set('n', "F", "<cmd>HopPattern<cr>") -- This doesn't work.


-- -- place a semicolon at the end of the line, would be nice if it reset cursor position
-- vim.keymap.set('i', '<C-;>', '<C-[><End>i')
-- vim.keymap.set('n', '<C-;>', '<End>a;<C-[>')

-- -- paste from clipboard in normal mode
-- vim.keymap.set('n', '<C-v>', function() send_keys('ip<C-[>') end)


-- if i use rust tools, i can do things like <leader>rj to combine lines
-- https://github.com/simrat39/rust-tools.nvim


-- unmap <f1> for help
-- vim.keymap.del('n', '<F1>')
-- vim.keymap.del({'n', 'i'}, '<F1>')


-- =====================
-- LSP GENERIC
local GoviGroup = vim.api.nvim_create_augroup('Govi', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = GoviGroup,
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    end,
})

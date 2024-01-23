local lsp = require('lsp-zero')

require('fidget').setup{}

lsp.preset('recommended')

-- I probably want to add to this list
lsp.ensure_installed({
    --'tsserver',
    --'eslint',
    -- sumneko_lua',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- go to previous suggestion
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- go to next suggestion
    ['<C-y>'] = cmp.mapping.confirm({select = true}), -- accept suggestion
    ['<C-Space>'] = cmp.mapping.complete(), -- This seems to just be outputting the word "complete"
})

-- disable sign icons, leaving them enabled for now
--lst.set_preferences({
--    sign_icons = {}
--})

-- attch custom selection mappings defined above
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- only attach these remaps when there is an lsp, fall back on vim defaults otherwise
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

lsp.setup()


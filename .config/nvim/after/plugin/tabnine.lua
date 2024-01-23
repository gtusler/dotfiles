require('tabnine').setup({
    disable_auto_comment = false,
    accept_keymap = "<C-l>",
    dismiss_keymap = '<C-]>',
    debounce_ms = 800,
    suggestion_color = { gui = '#808080', cterm = 244 },
    exclude_filtypes = { 'TelescopePrompt', 'NvimTree' },
    log_file_path = nil,
});


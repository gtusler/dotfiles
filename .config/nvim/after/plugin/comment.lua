require('nvim_comment').setup({
    -- add a space after the marker
    marker_padding = true,

    -- comment out whitespace lines
    comment_empty = true,

    -- comment empty comment whitespace
    comment_empty_trim_whitespace = true,

    -- Should key mappings be created
    create_mappings = true,

    -- Normal mode mapping left hand side
    line_mapping = 'gcc',

    -- Visual/Operator mapping left hand side
    operator_mapping = 'gc',

    -- text object mapping, comment chunk
    comment_chunk_text_operator = 'ic',

    -- Hook function to call before commenting takes place
    hook = nil
})


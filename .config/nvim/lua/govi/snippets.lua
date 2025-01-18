local util = require('govi.util')
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local extras = require('luasnip.extras')
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

-- jump to the next node in a snippet
vim.keymap.set({ 'i', 's' }, '<A-k>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- jump to the previous node in a snippet
vim.keymap.set({ 'i', 's' }, '<A-j>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- cycle to the next choice in a choice node.
vim.keymap.set({ 'i', 's' }, '<A-n>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

-- cycle to the previous choice in a choice node.
vim.keymap.set({ 'i', 's' }, '<A-N>', function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)

local function get_php_file_name_for_class()
    return util.get_current_file_name_noext()
end

ls.add_snippets('php', {
    s('dec', {
        t('declare(strict_types=1);'),
    }),
    s('newclass', fmt(
    [[
    <?php
    declare(strict_types=1);

    namespace {};

    class {}
    {{
        {}
    }}
    ]], {
        i(1), f(get_php_file_name_for_class), i(2)
    })),
    s('constructor', fmt(
    [[
    public function __construct({})
    {{
        {}
    }}
    ]], {
        i(1), i(2)
    }
    )),
})

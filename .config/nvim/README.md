I want to set up snippets for:
```php
<?php
declare(strict_types=1);
```

```elm
let1
let2
let3
let4
```




I want to figure out formatting on save.
I want the feature to be opt-out for if I'm working on a third-party project.

`null-ls` can't be the only way to do it, it's been deprecated for ages!

I already have `prettier` working for some file types:
- [x] css
- [x] graphql
- [x] html
- [x] javascript
- [x] javascriptreact
- [x] json
- [x] less
- [x] markdown
- [x] scss
- [x] typescript
- [x] typescriptreact
- [x] yaml
but `prettier` doesn't support all the languages I want.


Some languages come with a formatter, I want to use those where applicable.

I want autoformat for:
- [ ] elm
- [ ] lua - maybe
- [ ] rust
- [ ] python

I can run a command line program using:
```lua
vim.fn.system({
    "git",
    "clone",
    "https://github.com/gtusler/dotfiles.git",
})
```

I would also like to be able to do:
- `:ElmFmt` formats the current document
- `:LuaFmt` formats the current document
- `:RustFmt` formats the current document
- `:PythonFmt` formats the current document

To create global commands:
```lua
vim.api.nvim_create_user_command(
    {name}, -- string
    {command},  -- string or Lua function
    {attributes} -- table
)
```

To create a command attached to the current buffer:
```lua
vim.api.nvim_buf_create_user_command(
    {buffer number}, -- integer
    {name}, -- string
    {command}, -- string or Lua function
    {attributes} -- table
)
```

Definitely check `:help nvim_create_user_command` for more info

Something I found in my config:
```lua
-- autocommand for elm format, i wish
-- need to run a command line thing but nvim has its own things called commandline
-- great.
local elmfmt_group= vim.api.nvim_create_augroup( "Elm Format", {clear=true} )
vim.api.nvim_create_autocmd({"BufWritePost"},
    { pattern = {"*.elm"},
    })

local function do_elm_format()
    -- elm-format --yes elm/
end
vim.api.nvim_create_user_command('ElmFormat', do_elm_format, {})
vim.exec
```

We only want the commands to be defined in the relevant file formats.
That might be something we can get from `LspAttach`'s callback's `event` arg

The keymaps I want to use are:
```lua
vim.keymap.set('n', '<leader>ff', format_single_file)
vim.keymap.set('n', '<leader>fw', format_workspace)
vim.keymap.set('n', '<leader>fd', format_disable)
vim.keymap.set('n', '<leader>fe', format_enable)
vim.keymap.set('x', '<leader>fr', format_range)
```


## Elm formatting
Now, let's start with elm.

```lua
vim.api.nvim_create_user_command(
    'ElmFmt',
    function()
    end,
    {}
)
```





I'm thinking of ditching `null-ls` altogether. I think I can get what I need from the built in lsp stuff these days.

As I see it at the moment, there are 2 ways of attaching commands with the right lsp clients:
  - Get all the clients and filter to file types where I want to add format commands, the call `on_attach` there
  - When any client attaches, filter to file types and set up the commands there


Ok, upon further investigation I should be using one of these options:
 - [This](https://github.com/mattn/efm-langserver) and [this](https://github.com/creativenull/efmls-configs-nvim)
 - [This](https://github.com/lukas-reineke/lsp-format.nvim)
 - [This](https://github.com/mhartington/formatter.nvim)
 - [This](https://github.com/tjdevries/config.nvim/blob/master/lua/custom/autoformat.lua)

Give [this](https://www.reddit.com/r/neovim/comments/15oue2o/finally_a_robust_autoformatting_solution/) a read.

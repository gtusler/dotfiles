" length of an actual \t character
set tabstop=4

" length to use when editing text (eg. TAB and BS keys)
" (0 for 'tabstop', -f for 'shiftwidth')
set softtabstop=0

" length to use when shifting text (eg. <<, >> and == commands)
" (0 for 'tabstop')
set shiftwidth=0

" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T)
set shiftround

" if set, only insert spaces; otherwise insert \t and complete with spaces
set expandtab

" reproduce indentation of the previous line
set autoindent

" keep indentation produced by 'autoindent' if leaving the line blank
"set cpoptions+=I

" try to be smart (increase indent after '{', decrease after '}' etc)
"set smartindent

" a stricter alternative which works better for the C language
"set cindent

" use language specific plugins for indenting
filetype plugin indent on



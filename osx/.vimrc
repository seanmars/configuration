" create .vimrc file under ~/

" enable the highlight
syntax on
" show line number
set number
" mouse supported
set mouse=a
" enable backspace in insert mode
set backspace=2
" tab sapce
set tabstop=2
" auto indent space witdh
set shiftwidth=2
" auto comment when enter if current line is comment
set formatoptions+=r
" show unserline on current cursor line
set cursorline
" tab to whitespace
set expandtab

set enc=utf8
set scrolloff=3
filetype indent on

" color schmea of line number
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

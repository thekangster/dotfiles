"maps
nnoremap <C-l>h :tabr<cr>
nnoremap <C-l>l :tabl<cr>
nnoremap <C-n> :tabn<cr>
nnoremap <C-t> :tabnew<cr>
nnoremap <C-x> :tabc<cr>
nnoremap H gT
nnoremap L gt

"plugs
call plug#begin()
Plug 'gruvbox-community/gruvbox'
call plug#end()

let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_termcolors='256'
let g:AutoPairsFlyMode=0
set background=dark "set hg group to dark
colorscheme gruvbox "colorscheme
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set wildmenu
set wildmode=list:longest
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%4*\ [%p%%]            "percentage
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
hi User1 guifg=#eea040 guibg=#011221
hi User2 guifg=#dd3333 guibg=#011221
hi User3 guifg=#ff66ff guibg=#011221
hi User4 guifg=#fdf4c1 guibg=#011221
hi User5 guifg=#eeee40 guibg=#011221
"set statusline+=\ ascii:\ %b\,\ hex:\ 0x%B\,\ r:\ %l\,\ c:\ %c\,\ percent:\ %p%%

set laststatus=2
set scrolloff=3
set colorcolumn=81
set encoding=utf-8 "required by YCM
set expandtab
set foldlevel=99
set foldmethod=indent "fold your code.
set hidden "work with multiple unsaved buffers.
set incsearch "highlights as you search
set nohlsearch
set smartcase
set rnu nu "sets line numbers
set termguicolors "True colors term support
set showcmd
set guifont=MesloLGMDZ\ Nerd\ Font\ Bold\ 16

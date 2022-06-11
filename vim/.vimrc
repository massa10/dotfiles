" Author : massa10

" Don't be vi compatible
set nocompatible
let g:powerline_pycmd='py3'

" Plugins
filetype off " helps to load correctly plugins
syntax on
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""
" VPlug plugins
" call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree'

" Plug 'tpope/vim-surround'

" Plug 'scrooloose/nerdcommenter'
" let g:NERDSpaceDelims = 1 " 1 space after comment symbol



" call plug#end()
" End VPlug
""""""""""""""""""""""""""""""""""""""

" Define leader button
let mapleader = ","

" Security ?
set modelines=0

" Show line numbers
set number

"Show Positions
set ruler

" Backspace acting as it should
set backspace=eol,start,indent

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch

" Visual error
set visualbell

" Graphic
set t_Co=256
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
try
    colorscheme desert
catch
endtry

" Tabs
set expandtab " Use spaces
set smarttab
set shiftwidth=4
set tabstop=4

" Indent
set ai 
set si
set wrap

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Last line
set showmode
set showcmd

"""""""""""""""""""""""""""""""""
" Bindings
"""""""""""""""""""""""""""""""""
" Save with lead+w
nmap <leader>w :w!<cr> 

" Toggle row num with lead+n
:nmap <leader>n :set invnumber<CR>


" sudo save with :W
command W w !sudo tee % > /dev/null

" Remove search highligh
map <silent> <leader><cr> :noh<cr>

" Should fix vim paste while on tmux according to https://vi.stackexchange.com/questions/23110/pasting-text-on-vim-inside-tmux-breaks-indentation
"if &term =~ "screen"                                                   
"    let &t_BE = "\e[?2004h"                                              
"    let &t_BD = "\e[?2004l"                                              
"    exec "set t_PS=\e[200~"                                              
"    exec "set t_PE=\e[201~"                                              
"endif

""" STATUS BAR
 set laststatus=2
 function! InsertStatuslineColor(mode)
   if a:mode == 'i'
     hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
   elseif a:mode == 'r'
     hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
   else
     hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
   endif
 endfunction

 au InsertEnter * call InsertStatuslineColor(v:insertmode)
 au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
 hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
 set statusline=%f                           " file name
 set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
 set statusline+=%{&ff}] "file format
 set statusline+=%y      "filetype
 set statusline+=%h      "help file flag
 set statusline+=%m      "modified flag
 set statusline+=%r      "read only flag

 set statusline+=\ %=                        " align left
 set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
 set statusline+=\ Col:%c                    " current column
 set statusline+=\ Buf:%n                    " Buffer number
 set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

call pathogen#infect()
call pathogen#helptags()
runtime! plugin/sensible.vim
" Use :help 'option' to see the documentation for the given option.
set nocompatible
set nobackup
set noswapfile
set noerrorbells
set visualbell
set t_vb=
set modelines=1
set shortmess=aIoO
set splitbelow
set splitright
set number
set nuw=6
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set matchpairs+=<:>
set t_Co=256
set title
syntax enable

let g:gruvbox_italic=0
colorscheme gruvbox

set nospell
set hlsearch
set ignorecase
set smartcase
set textwidth=80
set formatoptions-=t
set formatoptions+=rn
set tabstop=2
set shiftwidth=4
set expandtab
set smartindent
nmap <C-E> :NERDTreeToggle<CR>
imap <C-E> <C-O><C-E>
let NERDTreeWinSize=40
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['build-.*', 'stage-.*']


set nowrap

set cursorline                    " highlight current line
set scrolloff=2                   " minimum lines above/below cursor


set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
" Color Scheme gruvbox
Plugin 'morhetz/gruvbox' 

"nathanaelkane/vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'

"railcast2 theme
Plugin 'jpo/vim-railscasts-theme'

" Airline (bottom bar)
Plugin 'bling/vim-airline'

" Git support
Plugin 'mhinz/vim-signify'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set nocompatible              " be iMproved, required

" Set Up Vundle plugin manager
filetype off                  " required during Vundle setup
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'     " let Vundle manage Vundle, required

" Keep Plugin commands between vundle#begin/end.
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required to enable Plugin-based indenting
" Put non-Plugin stuff after this line

" Enable syntax highlighting
syntax on

" Enable python-friendly indenting as default
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Be specific about how backspace works
set backspace=2

" Show line numbers
set number

" Enable airline
let g:airline#extensions#tabline#enabled = 1
" Enable airline immediately
set laststatus=2

" Custom keymapping
map <C-e> :NERDTreeToggle<CR>   " Toggle nerd tree with ctrl+e

" Hide .pyc files in NERDtree
let NERDTreeIgnore = ['\.pyc$']

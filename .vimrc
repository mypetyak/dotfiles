set nocompatible              " be iMproved, required

" ---- Vundle plugin manager ----
filetype off                  " required during Vundle setup
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
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'chriskempson/base16-vim'
" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required to enable Plugin-based indenting
" Put non-Plugin stuff after this line


" ---- Native settings ----

" Enable syntax highlighting
syntax on

" Helpful indenting
set smartindent
set autoindent

" Enable python-friendly indenting as default
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Be specific about how backspace works
set backspace=2

" Show line numbers
set number

set encoding=utf-8

" Heads-up-display stuff
set showmode
set showcmd
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
colorscheme base16-eighties
set background=dark

" Visual padding onsearch results
set scrolloff=3 

" Enable persistent undo across exits
set undofile

" Search enhancements
" Enable python-esque regex during search
nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
"set showmatch
set hlsearch

" Ignore case for all-lc searchwords only
set ignorecase
set smartcase

" Text wrapping
set wrap
set textwidth=79
"set colorcolumn=85

" Custom keymapping
map <C-e> :NERDTreeToggle<CR>   " Toggle nerd tree with ctrl+e
nnoremap ; :
inoremap jj <ESC>
"Handle splits easily
nnoremap <leader>w <C-w>v<C-w>l " Open vertical split and switch to it
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader><space>  :noh<CR>
" Allow j and k to navigate wrapped lines with sanity
nnoremap j gj
nnoremap k gk

" Turn on spelling highlighting for markdown
autocmd BufRead,BufNewFile *.markdown setlocal spell

" ----- Plugin Config -----

" Enable airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Enable airline immediately
set laststatus=2

" Hide .pyc files in NERDtree
let NERDTreeIgnore = ['\.pyc$']

" Hide gundo after reverting
let g:gundo_close_on_revert = 1

" Disable vim-markdown's default folding
let g:vim_markdown_folding_disabled=1

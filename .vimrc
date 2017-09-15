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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'rodjek/vim-puppet'
"Plugin 'severin-lemaignan/vim-minimap'
"Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-eunuch'
" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required to enable Plugin-based indenting
" Put non-Plugin stuff after this line


" ---- Native settings ----

" Mouse scrolling
set mouse=a

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

" vim-go settings
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

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
silent! colorscheme base16-eighties
"silent! colorscheme base16-summerfruit-light
"silent! colorscheme Tomorrow-Night-Eighties
"silent! colorscheme base16-tomorrow-night
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
"set textwidth=79
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
" Toggle buffers with ease
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

" Turn on spelling highlighting for markdown
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline

" ----- Plugin Config -----

"" Enable specific syntastic checkers
"let g:syntastic_sh_checkers = ['shellcheck']

" Enable airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'base16_summerfruit'
let g:airline_theme = 'base16_eighties'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Enable airline immediately
set laststatus=2

" Hide .pyc files in NERDtree
let NERDTreeIgnore = ['\.pyc$']

" Hide gundo after reverting
let g:gundo_close_on_revert = 1

" Disable vim-markdown's default folding
let g:vim_markdown_folding_disabled=1

" go-vim settings
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0

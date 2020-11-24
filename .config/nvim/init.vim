" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
" Plug 'integralist/vim-mypy'
Plug 'ambv/black'
Plug 'rust-lang/rust.vim'
" Initialize plugin system
call plug#end()

let g:rustfmt_command = '/home/bunn/.cargo/bin/rustfmt'
let g:python3_host_prog = '/home/bunn/.virtualenvs/nvim/bin/python3'
let g:black_virtualenv = '/home/bunn/.virtualenvs/nvim/'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:rustfmt_autosave = 1

set background=dark
colorscheme gruvbox

" Toggle buffers with ease
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

nnoremap ; :
inoremap jj <ESC>

" Show line numbers
set number

nnoremap <leader><space>  :noh<CR>

let c_space_errors=1

" Enable persistent undo across exits
set undofile

set ignorecase
set smartcase

nnoremap <c-p> :FZF pwd<CR>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoTo<CR>
map <leader>gf  :YcmCompleter GoToImprecise<CR>
map <leader>t  :YcmCompleter GetType<CR>
" Default compiler flags hinter
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_path_to_python_interpreter = '/home/bunn/.virtualenvs/nvim/bin/python3'

" Mouse scrolling
set mouse=a

" Helpful indenting
set smartindent
set autoindent

" default settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set copyindent      " copy indent from the previous line

set cursorline               " highlight current line<Paste>
set showmatch                " highlight matching brace

" c++ indenting
au BufNewFile,BufRead *.cpp set tabstop=2
au BufNewFile,BufRead *.cpp set softtabstop=2
au BufNewFile,BufRead *.cpp set shiftwidth=2
au BufNewFile,BufRead *.cpp set expandtab
au BufNewFile,BufRead *.cpp set autoindent
au BufNewFile,BufRead *.cpp set fileformat=unix

" Enable python-friendly indenting as default
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
"au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" java indenting
au BufNewFile,BufRead *.java set tabstop=4
au BufNewFile,BufRead *.java set softtabstop=4
au BufNewFile,BufRead *.java set shiftwidth=4
au BufNewFile,BufRead *.java set expandtab
au BufNewFile,BufRead *.java set autoindent
au BufNewFile,BufRead *.java set fileformat=unix

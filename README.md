My custom dotfiles!

# Installation
1. Clone the git repository

        git clone git@github.com:mypetyak/dotfiles.git

2. Visit the installation steps for the desired dot file, below.

# Vim

Provides support for syntax highlighting and linting (Python, Go, Scala), git
integration, gundo, fuzzy search, nerdtree, theming,
tabs-as-spaces, diagnostic info via vim-airline, and more.

## Installation Details
1. Symlink to vim config file

        ln -s dotfiles/.vimrc ~/.vimrc

2. Install the Vundle plugin manager:

        $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
3. Launch `vim`, then run `:PluginInstall` in normal mode to install plugins.

# Zsh

Provides theming and plugin support.

## Installation Details
1. Symlink to zsh config file and oh-my-zsh directory

        ln -s dotfiles/.zshrc ~/.zshrc
        ln -s dotfiles/.oh-my-zsh ~/.oh-my-zsh

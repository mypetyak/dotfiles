My custom dotfiles!

# Installation
1. Clone the git repository

        git clone git@github.com:mypetyak/dotfiles.git

2. Visit the installation steps for the desired dot file, below. Note that symlinks are built assuming the current working directory contains a "dotfiles" directory with the cloned repo in it.

# Vim

Provides support for syntax highlighting and linting (Python, Go, Scala), git
integration, gundo, fuzzy search, nerdtree, theming,
tabs-as-spaces, diagnostic info via vim-airline, and more.

## Installation Details
1. Symlink to vim config file

        ln -s "$PWD"/dotfiles/.vimrc ~/.vimrc

2. Install the Vundle plugin manager:

        $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
3. Launch `vim`, then run `:PluginInstall` in normal mode to install plugins.

# Zsh

Provides theming and plugin support.

## Installation Details
Symlink to zsh config file and oh-my-zsh theme file

    ln -s "$PWD"/dotfiles/.zshrc ~/.zshrc
    mkdir -p ~/.oh-my-zsh/themes/
    ln -s "$PWD"/dotfiles/.oh-my-zsh/themes/bunn.zsh-theme ~/.oh-my-zsh/themes/bunn.zsh-theme

# Git

Allows for portable gitconfig include file

## Installation Details
Include .gitconfig_include inside your .gitconfig file. Do this only one time.

    printf "[include]\n    path = %s/dotfiles/.gitconfig_include" "$PWD" >> ~/.gitconfig

# Homebrew

Installs apps on OSX via Homebrew package manager.

## Installation Details
Simply run the brew.sh script.

    ./brew.sh

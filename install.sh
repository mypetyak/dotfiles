#!/bin/bash
platform='unknown'
unamestr=`uname`
if [ "$unamestr" == 'Linux' ]; then
   platform='linux'
elif [ "$unamestr" == 'FreeBSD' ]; then
   platform='freebsd'
elif [ "$unamestr" == 'Darwin' ]; then
   platform='osx'
fi

suffix=$(date +"%Y%m%d%H%M")

# ----- VIM -----
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc_${suffix}
fi
ln -s "$(pwd)/.vimrc" ~/.vimrc
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# ----- GIT -----
# TODO: this isn't idempotent
printf "[include]\n    path = %s/.gitconfig_include" "$PWD" >> ~/.gitconfig
if [ -e ~/.gitconfig_include ]; then
    mv ~/.gitconfig_include ~/.gitconfig_include_${suffix}
fi
ln -s "$(pwd)/.gitconfig_include" ~/.gitconfig_include

# ----- BASH -----
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc_${suffix}
fi
ln -s "$(pwd)/.bashrc" ~/.bashrc

# ----- TMUX -----
if [ -e ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.confg_${suffix}
fi
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf

# ----- CHEAT -----
if [ -e ~/.cheat ]; then
    mv ~/.cheat ~/.cheat_${suffix}
fi
ln -s "$(pwd)/.cheat" ~/.cheat

# ----- MACOS -----
if [ $platform == 'osx' ]; then
	./brew.sh
    ./iterm2.sh
    ./asst.sh
fi

# ----- GO -----
command -v go &>/dev/null && {
    vim +GoInstallBinaries +qall
}

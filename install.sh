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

suffix=$(date -d "today" +"%Y%m%d%H%M")

# Clone source
if [ ! -d "dotfiles" ]; then
    git clone https://github.com/mypetyak/dotfiles.git
fi

# ----- VIM -----
if [ -f "`eval echo ~/.vimrc`" ]; then
    mv ~/.vimrc "~/.vimrc_${suffix}"
fi
ln -s dotfiles/.vimrc ~/.vimrc
if [ ! -d "`eval echo ~/.vim/bundle/Vundle.vim`" ]; then
    echo 
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
vim +GoInstallBinaries +qall

# ----- GIT -----
# TODO: this isn't idempotent
printf "[include]\n    path = %s/dotfiles/.gitconfig_include" "$PWD" >> ~/.gitconfig

# ----- TMUX -----
if [ -e "~/.tmux.conf" ]; then
    mv ~/.tmux.conf "~/.tmux.confg_${suffix}"
fi
ln -s dotfiles/.tmux.conf ~/.tmux.conf

# ----- HOMEBREW -----
if [ $platform == 'osx' ]; then
	./brew.sh
fi

# ----- CHEAT -----
if [ -d "`eval echo ~/.cheat`" ]; then
    mv ~/.cheat "~/.cheat_${suffix}"
fi
ln -s dotfiles/.cheat ~/.cheat

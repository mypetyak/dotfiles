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

# ----- VIM -----
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc_${suffix}
fi
ln -s .vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
vim +GoInstallBinaries +qall

# ----- GIT -----
# TODO: this isn't idempotent
printf "[include]\n    path = %s/.gitconfig_include" "$PWD" >> ~/.gitconfig

# ----- TMUX -----
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.confg_${suffix}
fi
ln -s .tmux.conf ~/.tmux.conf

# ----- HOMEBREW -----
if [ $platform == 'osx' ]; then
	./brew.sh
    ./iterm2.sh
fi

# ----- CHEAT -----
if [ -d ~/.cheat ]; then
    mv ~/.cheat ~/.cheat_${suffix}
fi
ln -s .cheat ~/.cheat

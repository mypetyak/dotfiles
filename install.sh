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

# Clone source
if [ ! -d "dotfiles" ]; then
    git clone https://github.com/mypetyak/dotfiles.git
fi

# ----- VIM -----
if [ -f "`eval echo ~/.vimrc`" ]; then
    mv ~/.vimrc ~/.vimrc_$(date -d "today" +"%Y%m%d%H%M")
fi
ln -s "$PWD"/dotfiles/.vimrc ~/.vimrc
if [ ! -d "`eval echo ~/.vim/bundle/Vundle.vim`" ]; then
    echo 
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# ----- ZSH -----
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
if [ -f "`eval echo ~/.zshrc`" ]; then
    mv ~/.zshrc ~/.zshrc_$(date -d "today" +"%Y%m%d%H%M")
fi
ln -s "$PWD"/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/themes/
if [ ! -f "`eval echo ~/.oh-my-zsh/themes/bunn.zsh-theme`" ]; then
    ln -s "$PWD"/dotfiles/.oh-my-zsh/themes/bunn.zsh-theme ~/.oh-my-zsh/themes/bunn.zsh-theme || true
fi

# ----- GIT -----
# TODO: this isn't idempotent
printf "[include]\n    path = %s/dotfiles/.gitconfig_include" "$PWD" >> ~/.gitconfig

# ----- HOMEBREW -----
if [ $platform == 'osx' ]; then
	./brew.sh
fi

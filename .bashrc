# vi mode stuff
set -o vi
# change ctrl+w behavior to erase up to the last non-word char
bind 'set bind-tty-special-chars off'
bind '"\C-w":backward-kill-word'

# allow colorification in readline and others
TERM=xterm-256color

# some defaults
export EDITOR=vim

# symlink the current ssh-agent auth socket to a common location, so that
# we can find it later.
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
# override the ssh-agent auth socket used by tmux with the current
# one; note that tmux may have been started long ago, with a now-outdated
# socket reference.
alias tmux="export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock; tmux a || tmux"

# history
shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoredups
#HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

# enable fasd
if command -v fasd &>/dev/null; then
    eval "$(fasd --init auto)"
fi

# assorted
alias tree='tree -C'
alias ls='ls -G'

# golang
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

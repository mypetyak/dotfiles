# change ctrl+w behavior to erase up to the last non-word char
bind 'set bind-tty-special-chars off'
bind '"\C-w":backward-kill-word'

# some defaults
export EDITOR=nvim

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
HISTCONTROL=ignoredups:erasedups
#HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

# prompt
shopt -s promptvars
PROMPT_COMMAND=__prompt_command
__prompt_command() {
    # grap the previous exit status
    local exit_status="$?"

    # store history immediately
    history -a

    _PS1_now=$(date +%s)

    PS1='\n'

    # if inside an SSH connection, display username:hostname
    if [ -n "${SSH_TTY}" ] || [ -n "${SSH_CLIENT}" ]; then
        PS1+='\[\e[41m\]\[\e[1m\] \u@\H \[\e[0m\] '
    fi

    # show tail end of working directory
    PS1+='\[\e[1m\]\[\e[34m\]\W\[\e[0m\]'

    # include git branch
    PS1+='\[\e[2m\]'"$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')"'\[\e[0m\]'

    # add the "*" for dirty git repos
    if [ $(git diff --numstat 2>/dev/null| wc -l) -ne 0 ]; then
        PS1+='\[\e[2m\]*\[\e[0m\]'
    fi

    # include execution time of previous command
    if [ -n "${_PS1_previous}" ]; then
        PS1+=' \[\e[33m\]'"$(( ( _PS1_now - _PS1_previous ) ))s"'\[\e[0m\]'
    fi

    # linebreak
    PS1+='\n'

    # include chevron, colored based on previous return code
    if [ ${exit_status} -ne 0 ]; then
        PS1+='\[\e[31m\]❯\[\e[0m\] '
    else
        PS1+='\[\e[35m\]❯\[\e[0m\] '
    fi
    _PS1_previous=$_PS1_now
}

# enable fasd
if command -v fasd &>/dev/null; then
    eval "$(fasd --init auto)"
fi

# docker things
alias devbox='docker run --rm -e TERM=screen-256color -v $(pwd):/host -it bunn/devbox:latest /bin/bash'
alias devbox-norm='docker run -e TERM=screen-256color -v $(pwd):/host -it bunn/devbox:latest /bin/bash'

# assorted
alias tools='open https://bunn.cc/tools'
alias tree='tree -C'
alias ls='ls -G'
alias gs='git status'

# golang
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

if [ -f ~/.fzf.bash ]
then
    source ~/.fzf.bash
    # Use fd (https://github.com/sharkdp/fd) instead of the default find
    # command for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

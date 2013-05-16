# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f `brew --prefix`/etc/bash_completion ]; then
    source  `brew --prefix`/etc/bash_completion
fi

if [ -f $BASH_COMPLETION_DIR/git ]; then
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

EDITOR=/usr/local/bin/vim
export EDITOR

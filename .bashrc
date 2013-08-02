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

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh 
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ -f $BASH_COMPLETION_DIR/git-prompt.sh ]; then
    . $BASH_COMPLETION_DIR/git-prompt.sh
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

EDITOR=/usr/local/bin/vim
export EDITOR

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias vi=/usr/local/bin/vim
alias tar=/usr/local/bin/tar

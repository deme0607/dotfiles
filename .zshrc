# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases
alias clcache="sudo dscacheutil -flushcache"

# environment valiables config
export PATH="/usr/local/opt/android-sdk/build-tools:$PATH"
export PATH="/usr/local/opt/android-sdk/tools:$PATH"
export PATH="/usr/local/opt/android-sdk/platform-tools:$PATH"
export PATH="/usr/local/opt/android-sdk/build-tools/19.0.1:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.plenv/shims:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export EXENV_ROOT="/usr/local/var/exenv"
if which exenv > /dev/null; then eval "$(exenv init -)"; fi

# language config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='/usr/bin/vi'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/perl5/perlbrew/etc/bashrc

eval "$(rbenv init - zsh)"

if [ -f $HOME/.homebrew_api_token ];then
        source $HOME/.homebrew_api_token
fi

if [ -f $HOME/.ssh/id_rsa.gateway ];then
        ssh-add $HOME/.ssh/id_rsa.gateway
fi

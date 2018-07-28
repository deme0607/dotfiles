# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

fpath+=("/usr/local/share/zsh-completions")

# aliases
alias clcache="sudo dscacheutil -flushcache"
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias be='bundle exec'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# environment valiables config
export PATH="/usr/local/bin:$PATH"
export RBENV_ROOT="/usr/local/opt/rbenv"
export GOPATH="$HOME/go"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export MANPATH="/usr/local/man:$MANPATH"

export EXENV_ROOT="/usr/local/var/exenv"
if which exenv > /dev/null; then eval "$(exenv init -)"; fi

# language config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export LD_LIBRARY_PATH=/usr/local/Cellar/kakasi/2.3.6/lib/:/usr/local/Cellar/libmarisa/0.2.4/lib/

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='/usr/bin/vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/perl5/perlbrew/etc/bashrc

eval "$(rbenv init - zsh)"

eval "$(hub alias -s)"

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

if [ -f $HOME/.homebrew_api_token ];then
        source $HOME/.homebrew_api_token
fi

if [ -f $HOME/.ssh/id_rsa.gateway ];then
        ssh-add $HOME/.ssh/id_rsa.gateway
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/shimizu.naoki/work/work/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/shimizu.naoki/work/work/google-cloud-sdk/completion.zsh.inc'

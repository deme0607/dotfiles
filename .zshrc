# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

fpath+=("/usr/local/share/zsh-completions")

# aliases

# environment valiables config
export PATH="/usr/local/bin:$PATH"
export GOPATH="$HOME/work"
export PATH="$PATH:$GOPATH/bin"
export MANPATH="/usr/local/man:$MANPATH"

if [ -d ~/.local/bin ]; then
  export PATH="$PATH":~/.local/bin
  powerline-daemon -q
  . ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# language config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR='/usr/bin/vim'

eval "$(hub alias -s)"

fpath+=(~/.zsh/completions)
autoload -U compinit && compinit

if [ -f $HOME/.homebrew_api_token ];then
        source $HOME/.homebrew_api_token
fi

source '/usr/local/share/zsh/site-functions'

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

setopt nonomatch

bindkey '^[' peco-src
function peco-src() {
        local src=$(ghq list --full-path | peco --query "$LBUFFER")
        if [ -n "$src" ]; then
                BUFFER="cd $src"
                zle accept-line
        fi

        zle -R -c
}
zle -N peco-src

function gcfg() {
  configuration_name=$(gcloud config configurations list | peco | awk '{print $1}')
  if [ -n "${configuration_name}" ]; then
    gcloud config configurations activate "${configuration_name}"
  fi
}

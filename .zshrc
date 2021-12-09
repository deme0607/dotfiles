if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

# aliases

export VISUAL=vim
export EDITOR="$VISUAL"

# environment valiables config
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$HOME/work"
export MANPATH="/usr/local/man:$MANPATH"

if [ -d /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

if [ -d $(brew --prefix asdf) ]; then
  . $(brew --prefix asdf)/asdf.sh
fi

# language config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

if type brew &>/dev/null; then
        FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
        autoload -Uz compinit
        compinit
fi

#function () {
#       GIT_ZSH_COMPLETIONS_FILE_PATH="$(brew --prefix)/share/zsh/site-functions/_git"
#       if [ -f $GIT_ZSH_COMPLETIONS_FILE_PATH ]
#       then
#               rm $GIT_ZSH_COMPLETIONS_FILE_PATH
#       fi
#}

autoload -U compinit && compinit
zmodload -i zsh/complist

if [ -f $HOME/.homebrew_api_token ];then
        source $HOME/.homebrew_api_token
fi

# source '/usr/local/share/zsh/site-functions'

setopt nonomatch

# Source Prezto.
if [ -d ~/.zprezto ]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

# Prompt
autoload -U colors; colors
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

if [ $commands[kubectl] ]; then
        source <(kubectl completion zsh)
fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

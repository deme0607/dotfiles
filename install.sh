#!/bin/bash

FILES=(.zshrc .vim .vimrc .tmux.conf)
BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"

echo $BASEDIR

for file in ${FILES[@]}
do
    orgfile=$HOME/$file
    if [ -L ${orgfile} ]; then
        echo "Remove existing symbolic link"
        rm -v ${orgfile}
    elif [ -f ${orgfile} -o -d ${orgfile} ]; then
        echo "Backup original file"
        mv ${orgfile} ${orgfile}_`date +%Y%m%d`
    fi

    echo "Create symbolic link: $HOME/$file"
    ln -s $BASEDIR/$file $HOME/$file
done

brew bundle

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s "$(brew --prefix)/bin/zsh"

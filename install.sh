#!/bin/bash

# Create symbolic links
FILES=(.vim .vimrc .tmux.conf)

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
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# Update Neobundle
if [ ! -d $HOME/.vim/bundle ]; then
    git submodule init
    git submodule update
fi


#!/bin/sh

ROOT=$(cd "$(dirname $0)"; pwd)
cd "$ROOT"

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc{,.bak}
fi
ln -s "$ROOT"/vimrc ~/.vimrc

if [ ! -f local.vim ]; then
    cat /dev/null > local.vim
fi

for i in autoload bundle; do
    if [ ! -d $i ]; then
        mkdir $i
    fi
done

git submodule update --init --recursive

ln -s "$ROOT"/third-party/vim-pathogen/autoload/pathogen.vim autoload/pathogen.vim


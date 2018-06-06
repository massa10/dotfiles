#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $(ls ~/.vimrc 2> /dev/null) ]
then
    mv ~/.vimrc ~/.vimrc.pre-massa10
fi

cp $DIR/.vimrc ~/.vimrc

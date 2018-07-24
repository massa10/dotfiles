#!/bin/sh

DIR="$( dirname $( readlink -f "$0") )"

if [ $(ls ~/.vimrc 2> /dev/null) ]
then
    mv ~/.vimrc ~/.vimrc.pre-massa10
fi

cp $DIR/.vimrc ~/.vimrc

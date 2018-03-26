#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mv ~/.vimrc ~/.vimrc.bkk

cp .vimrc ~/.vimrc

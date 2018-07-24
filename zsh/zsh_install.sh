#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


echo Starting install

if  [ $(which apt-get 2> /dev/null) ]
then
    echo apt-get detected
    INSTALL="sudo apt-get install -y"
elif [ $(which pacman 2> /dev/null) ]
then
    echo pacman detected
    INSTALL="sudo pacman -S --noconfirm --needed"
elif [ $(which yum 2> /dev/null)]
then
    echo yum detected
    INSTALL="sudo yum install -y"
fi

echo Installing requirements: zsh curl git

$INSTALL zsh curl git

echo Installing oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/env zsh/d')"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp $DIR/manto.zsh-theme ~/.oh-my-zsh/themes/

if [ $(ls ~/.zshrc 2> /dev/null) ]
then
    mv ~/.zshrc ~/.zshrc.before-massa10
fi

cp $DIR/.zshrc ~/.zshrc

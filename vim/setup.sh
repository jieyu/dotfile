#!/bin/sh


# Make sure that vim and git are installed.
if ! type vim > /dev/null 2>&1; then
  echo "Please install vim first!"
  exit 1
fi

if ! type git > /dev/null 2>&1; then
  echo "Please install git first!"
  exit 1
fi


# Confirm with the user that we will replace .vimrc and ~/.vim.
if [ -f `echo ~/.vimrc` ]; then
  read -p "Are you sure you want to replace ~/.vimrc [y/n]? " choice
  case "$choice" in
    y|Y ) ;;
    n|N ) exit 1;;
    * ) exit 1;;
  esac
fi

if [ -d `echo ~/.vim` ]; then
  read -p "Are you sure you want to replace ~/.vim [y/n]? " choice
  case "$choice" in
    y|Y ) ;;
    n|N ) exit 1;;
    * ) exit 1;;
  esac
fi


BASE=$(dirname $0)
if [ $BASE = "." ]; then
  BASE=$(pwd)
fi


set -eux -o pipefail


# Install and configure Vundle.
rm -f ~/.vimrc
rm -rf ~/.vim
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
cp $BASE/vimrc ~/.vimrc
vim +PluginInstall +qall

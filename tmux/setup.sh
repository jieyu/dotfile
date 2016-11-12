#!/bin/sh


# Make sure that tmux is installed.
if ! type tmux > /dev/null 2>&1; then
  echo "Please install tmux first!"
  exit 1
fi


# Confirm with the user that we will replace .tmux.conf.
if [ -f `echo ~/.tmux.conf` ]; then
  read -p "Are you sure you want to replace ~/.tmux.conf [y/n]? " choice
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


set -eux


# Configure tmux.
rm -f ~/.tmux.conf
cp $BASE/tmux.conf ~/.tmux.conf

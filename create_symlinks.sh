#!/usr/bin/env sh
set -euo pipefail

base_dir=$(dirname "$PWD/$0")

if [ ! -f $HOME/.vimrc ]; then
  echo "Linking .vimrc"
  ln -s $base_dir/vim/vimrc $HOME/.vimrc
else
  echo "Skipping .vimrc"
fi

if [ ! -f $HOME/.zshrc ]; then
  echo "Linking .zshrc"
  ln -s $base_dir/zsh/zshrc $HOME/.zshrc
else
  echo "Skipping .zshrc"
fi

if [ ! -f $HOME/.tmux.conf ]; then
  echo "Linking .tmux.conf"
  ln -s $base_dir/tmux/tmux.conf $HOME/.tmux.conf
else
  echo "Skipping .tmux.conf"
fi

if [ ! -f $HOME/.gitconfig ]; then
  echo "Linking .gitconfig"
  ln -s $base_dir/git/gitconfig $HOME/.gitconfig
else
  echo "Skipping .gitconfig"
fi

if [ ! -f $HOME/.gitignore_global ]; then
  echo "Linking .gitignore_global"
  ln -s $base_dir/git/gitignore_global $HOME/.gitignore_global
else
  echo "Skipping .gitignore_global"
fi

if [ ! -f $HOME/.vim/colors/base16-default-dark.vim ]; then
  echo "Linking vim colors"
  ln -s $HOME/.vim/bundle/base16-vim/colors/* $HOME/.vim/colors/
else
  echo "Skipping vim colors"
fi

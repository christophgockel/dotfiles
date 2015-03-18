#!/usr/bin/env sh

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [ ! -f ~/.vimrc ]; then
  echo "Linking .vimrc"
  ln -s $base_dir/vim/vimrc ~/.vimrc
else
  echo "Skipping .vimrc"
fi

if [ ! -f ~/.zshrc ]; then
  echo "Linking .zshrc"
  ln -s $base_dir/zsh/zshrc ~/.zshrc
else
  echo "Skipping .zshrc"
fi

if [ ! -f ~/.tmux.conf ]; then
  echo "Linking .tmux.conf"
  ln -s $base_dir/tmux/tmux.conf ~/.tmux.conf
else
  echo "Skipping .tmux.conf"
fi


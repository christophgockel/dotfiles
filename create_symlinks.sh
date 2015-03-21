#!/usr/bin/env sh

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


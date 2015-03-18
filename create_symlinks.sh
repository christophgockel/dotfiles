#!/usr/bin/env sh

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [ ! -f ~/.vimrc ]; then
  echo "Linking .vimrc"
  ln -s $base_dir/vim/vimrc ~/.vimrc
else
  echo "Skipping .vimrc"
fi

if [ ! -f ~/.vim/colors/base16-default.vim ]; then
  echo "Linking vim color scheme"
  mkdir -p ~/.vim/colors
  ln -s $base_dir/base16/base16-default.vim ~/.vim/colors/base16-default.vim
else
  echo "Skipping vim color scheme"
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


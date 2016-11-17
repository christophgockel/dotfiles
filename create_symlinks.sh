#!/usr/bin/env sh
set -euo pipefail

base_dir=$(dirname "$PWD/$0")

function create_link_if_needed {
  local source=$1
  local target=$2
  local target_file=$(basename $target)

  if [ ! -f $target ]; then
    echo "Linking $target_file"
    ln -s $source $target
  else
    echo "Skipping $target_file"
  fi
}

create_link_if_needed "$base_dir/vim/vimrc", "$HOME/.vimrc"
create_link_if_needed "$base_dir/zsh/zshrc", "$HOME/.zshrc"
create_link_if_needed "$base_dir/tmux/tmux.conf", "$HOME/.tmux.conf"
create_link_if_needed "$base_dir/git/gitconfig", "$HOME/.gitconfig"
create_link_if_needed "$base_dir/git/gitignore_global", "$HOME/.gitignore_global"

if [ ! -f $HOME/.vim/colors/base16-default-dark.vim ]; then
  echo "Linking vim colors"
  ln -s $HOME/.vim/bundle/base16-vim/colors/* $HOME/.vim/colors/
else
  echo "Skipping vim colors"
fi


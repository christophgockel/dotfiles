#!/usr/bin/env sh

base_dir=$(dirname "$PWD/$0")

target_dir="$base_dir/base16-iterm2"

if [ ! -d "$target_dir" ]; then
  echo "cloning base16-iterm2 into ${target_dir}"
  mkdir -p $target_dir
  git clone https://github.com/base16-project/base16-iterm2.git $target_dir
else
  echo "base16-iterm2 already cloned"
fi


target_dir="$base_dir/base16-shell"

if [ ! -d "$target_dir" ]; then
  echo "cloning base16-shell into ${target_dir}"
  mkdir -p $target_dir
  git clone https://github.com/base16-project/base16-shell.git $target_dir
else
  echo "base16-shell already cloned"
fi

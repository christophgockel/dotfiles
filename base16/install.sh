#!/usr/bin/env sh

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

target_dir="$base_dir/base16-iterm2"

if [ ! -d "$target_dir" ]; then
  echo "cloning base16-iterm2 into ${target_dir}"
  mkdir -p $target_dir
  git clone git@github.com:chriskempson/base16-iterm2.git $target_dir
else
  echo "base16-iterm2 already cloned"
fi


target_dir="$base_dir/base16-shell"

if [ ! -d "$target_dir" ]; then
  echo "cloning base16-shell into ${target_dir}"
  mkdir -p $target_dir
  git clone git@github.com:chriskempson/base16-shell.git $target_dir
else
  echo "base16-shell already cloned"
fi

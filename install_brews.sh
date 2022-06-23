#!/usr/bin/env sh
set -euo pipefail

formulae=(
  "tmux"
  "reattach-to-user-namespace"
  "zsh"
  "git"
  "maven"
  "chruby"
  "ruby-install"
  "the_silver_searcher"
  "fzf"
  "fnm"
  "jenv"
)

for formula in ${formulae[@]}
do
  echo "Installing: ${formula}"
  brew install $formula
done

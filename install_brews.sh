#!/usr/bin/env sh

formulae=(
  "caskroom/cask/brew-cask"
  "tmux"
  "reattach-to-user-namespace"
  "zsh"
  "git"
  "maven"
  "chruby"
  "ruby-build"
  "the_silver_searcher"
)

for formula in ${formulae[@]}
do
  echo "Installing: ${formula}"
  brew install $formula
done

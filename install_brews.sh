#!/usr/bin/env sh

formulae=(
  "caskroom/cask/brew-cask"
  "tmux"
  "zsh"
)

for formula in ${formulae[@]}
do
  echo "Installing: ${formula}"
  brew install $formula
done

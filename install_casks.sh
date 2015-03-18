#!/usr/bin/env sh

casks=(
  "dropbox"
  "1password"
  "cloak"
  "superduper"

  "google-chrome"
  "firefox"

  "iterm2"
  "alfred"
  "slack"
  "caffeine"
  "the-unarchiver"
  "things"
  "thunderbird"
  "virtualbox"
  "vlc"

  "intellij-idea-ce"
  "sequel-pro"
  "cyberduck"
  "sketch"
  "sublime-text"
)

for cask in ${casks[@]}
do
  echo "Installing: ${cask}"
  brew cask install $cask
done
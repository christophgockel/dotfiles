#!/usr/bin/env sh
set -euo pipefail

casks=(
  "dropbox"
  "1password"
  "cloak"
  "superduper"

  "google-chrome"
  "firefox"

  "alfred"
  "slack"
  "caffeine"
  "the-unarchiver"
  "things"
  "thunderbird"
  "vlc"

  "intellij-idea-ce"
  "sequel-pro"
  "cyberduck"
  "sublime-text"
)

for cask in ${casks[@]}
do
  echo "Installing: ${cask}"
  brew cask install $cask
done

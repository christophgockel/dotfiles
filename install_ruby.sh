#!/usr/bin/env sh
set -euo pipefail

version="2.4.3"

ruby-install $version
source ~/.zshrc
chruby $version

gem install bundler

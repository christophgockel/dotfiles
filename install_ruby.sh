#!/usr/bin/env sh
set -euo pipefail

version="2.2.1"

ruby-build $version ~/.rubies/$version
chruby $version

gem install bundler

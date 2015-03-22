#!/usr/bin/env sh

version="2.2.1"

ruby-build $version ~/.rubies/$version
chruby $version

gem install bundler

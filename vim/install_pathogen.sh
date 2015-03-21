#!/usr/bin/env sh

mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso $HOME/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

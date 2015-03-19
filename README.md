# dotfiles

Configuration and setup files.

The idea is to set up a new system with minimal effort.


## Usage

Several shell scripts are prepared to automate most of the installation process.

### Homebrew Packages
```
sh install_brews.sh
```
To install the basic set of applications like `zsh`, `tmux`, `git` ...

### Cask Packages
```
sh install_casks.sh
```
To install even more applications.


### Configuration Files
```
sh create_symlinks.sh
```
is used to create symlinks for vim, zsh and tmux configuration files.

#### Vim Specific Setup
```
sh vim/install_pathogen.sh
ruby vim/update_plugins.rb
```
to install Pathogen and vim plugins automatically. `update_plugins.rb` can be used later again to update all plugins automatically.

### Base16 Colors
To set up the [base16](https://github.com/chriskempson/base16) colors run
```
sh base16/install.sh
```
This clones the needed repos for zsh and iTerm colors.

One manual step for iTerm is needed: Import the desired color scheme via

`Preferences > Profiles > Colors > Load Presets > Import...`

(don't forget to activate it after the import)
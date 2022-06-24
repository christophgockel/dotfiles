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


### Base16 Colors

To set up the [base16](https://github.com/chriskempson/base16) colors run
```
sh base16/install.sh
```
This clones the needed repos for zsh and iTerm colors.

One manual step for iTerm is needed: Import the desired color scheme via

`Preferences > Profiles > Colors > Color Presets > Import...`

(don't forget to activate it after the import)

And make sure to run this command to enable the specific color scheme in the terminal:

```
base16_default-dark
```


### Configuration Files
```
sh create_symlinks.sh
```
is used to create symlinks for vim, zsh and tmux configuration files.


### Additional Steps

Some languages and tools need additional steps to finish their installation.


#### Hide Files on Desktop
```
defaults write com.apple.finder CreateDesktop false
killall Finder
```


#### Java

`jenv` is used as a version manager.

In order to install JDKs additional commands need to be executed:

```
brew install openjdk@17

jenv add /opt/homebrew/opt/openjdk@17

jenv global 17.0
```


#### JavaScript

`fnm` is used as a version manager.

In order to install JDKs additional commands need to be executed:

```
fnm install v16.15.1
fnm use v16.15.1
```


#### Ruby

`chruby` is used as a version manager and `ruby-install` is used to install new versions of Ruby.

```
ruby-install ruby 3.1.2
chruby ruby
```


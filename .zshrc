# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export ZDOTDIR=$HOME

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.dotfiles/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
source $BASE16_SHELL

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.1
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME
export PATH="$HOME/.rbenv/bin:$PATH"


alias pip='nocorrect pip'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit master'

alias tac='tail -r'

eval "$(rbenv init -)"

function mcd() { mkdir -p $1 && cd $1 } # from @garybernhardt

function tpipe (){ 
  [[ -e test-commands ]] && rm test-commands 
  mkfifo test-commands 
  echo 'trap "rm -f test-commands run-test-commands.sh; exit" INT; while true; do sh -c "$(cat test-commands)"; done' > run-test-commands.sh 
  sh run-test-commands.sh 
}

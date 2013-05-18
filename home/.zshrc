#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export ANDROID_HOME=$HOME/code/android/sdk
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH=/usr/local/share/npm/lib/node_modules
export CLOJURESCRIPT_HOME=$HOME/code/clojurescript
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin

# rbenv setup
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
eval "$($HOME/code/av/bin/av init -)"
eval "$(fasd --init auto)"
eval $(dircolors -b $HOME/.dircolors)

bindkey '^R' history-incremental-search-backward
source $HOME/.zshrc.local

unsetopt correct

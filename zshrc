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
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export NODE_PATH=/usr/local/lib/node_modules

# rbenv setup
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

eval $(dircolors -b $HOME/.dircolors)

source $HOME/.zshrc.local


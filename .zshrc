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

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# rbenv setup
if which rbenv > /dev/null; then eval "$(rbenv init - )"; fi

source $HOME/.zshrc.local

# enable zmv command
autoload zmv

eval $(dircolors -b $HOME/.dotfiles/LS_COLORS/LS_COLORS)

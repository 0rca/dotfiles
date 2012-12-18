# Customize to your needs...
export PATH=/usr/local/opt/coreutils:/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# eval "$(rbenv init -)"
# rbenv setup
# setup rbenv executable and shims path. Shims can be setup automatically
# by 'rbenv init', but it is a performance hit because 'init' also calls
# 'rbenv rehash' internally
# see (https://github.com/sstephenson/rbenv#-23-neckbeard-configuration)
# for details
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

# install autocompletion
source ~/.rbenv/completions/rbenv.zsh

# rehash shims (commented out on purpose)
# rbenv rehash

#install shell dispatcher
rbenv() {
  local command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}


source $HOME/.zshrc.local

# enable zmv command
autoload zmv

eval $(dircolors -b $HOME/dotfiles/LS_COLORS/LS_COLORS)

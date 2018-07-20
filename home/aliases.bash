## .zshrc.local

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin
export PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin
# export PATH="$PATH:$(yarn global bin)"
export PATH="/usr/local/heroku/bin:$PATH"
export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"
export ANDROID_HOME=$HOME/code/android/sdk
export GOPATH=$HOME/code/go
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export MONO_GAC_PREFIX="/usr/local"
export TODO_TXT_PATH=$HOME/.todo.txt
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
export V8_HOME=/usr/local/Cellar/v8/3.21.17/bin
export MAKEFLAGS="-j 8"
export MY_RUBY_HOME=/usr
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

if which brew > /dev/null; then
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi

eval "$(fasd --init auto)"

alias bx='bundle exec'
alias bo='bundle open'
alias cb='`git rev-parse --abbrev-ref HEAD`'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias g='git status'
alias gco='git checkout'
alias gd='git diff'
alias gp='git push'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gb='git branch -v'
alias gbi='git branch | cut -c 3- | fzf | xargs git checkout'
alias gmi='git branch | cut -c 3- | fzf | xargs -I {} git merge {} --no-ff'
alias gc='git commit'
alias gca='git commit -a'
alias gff='git merge --ff-only origin/`git rev-parse --abbrev-ref HEAD`'
alias gl='git log --graph --oneline --decorate'

alias o='open'
alias reload='source ~/.zprofile'
alias ra='source ~/.aliases.zsh'

alias e=$EDITOR
alias ec="$EDITOR ~/.lein/profiles.clj"
alias ea="$EDITOR ~/.aliases.zsh"
alias ev="$EDITOR ~/.vimrc"
alias ep="$EDITOR ~/.zprofile"
alias el="$EDITOR ~/.zsh.local"
alias er="$EDITOR ~/.zshrc"
alias ei="$EDITOR ~/.inputrc"
alias et="$EDITOR ~/.tmux.conf"
alias es="$EDITOR ~/.ssh/config"
alias eal="$EDITOR ~/.config/alacritty/alacritty.yml"

# osx
alias el="$EDITOR ~/Documents/Ledger/money1.ledger"
alias lr='ledger -f ~/Documents/Ledger/money1.ledger'
alias tailf='tail -f'

tmuxstart() {
  TMUX= tmux -2 new-session -d -s $1
  TMUX= tmux send-keys -t "$1" "$2" C-m
}

start-kafka() {
  tmux new-session -d -s kafka-server -n zookeeper-server zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties
  tmux new-window -d -n kafka-server -t kafka-server kafka-server-start /usr/local/etc/kafka/server.properties
}

stop-kafka() {
  kafka-server-stop; zookeeper-server-stop
}

function tm {
  tmux -2 new-session -s "$USER"
}

# fj - changing directory with fasd
fj() {
  local dir
  dir=$(fasd -Rdl | fzf --no-sort +m) && cd "$dir"
}

function clip() {
  [ -t 0 ] && pbpaste || pbcopy
}

alias c=cli
alias ec="vim ~/.local/bin/cli"
alias e.='e .'
alias st='open -a SourceTree'
alias st.='open -a SourceTree .'
alias git=hub
alias mps="mix phx.server"
alias vim=nvim
alias xee='open -a "Xee³"'
alias idea='open -a "IntelliJ IDEA CE"'

function gcoi() {
  git checkout `git branch --list --no-color | cut -c 3- | fzf -q $1`
}

function gbdi() { # git branch -D interactively
  git branch -d `git branch --list --no-color | cut -c 3- | fzf -q $1`
}

alias pgup="postgres -D /usr/local/var/postgres10.1"


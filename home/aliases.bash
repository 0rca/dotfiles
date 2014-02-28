## .zshrc.local
# paths setup
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
export JSC_HOME=/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
# export GOPATH=$HOME/code/go
export ANDROID_HOME=$HOME/code/android/sdk
# export JAVA_HOME="$(/usr/libexec/java_home)"
# export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH=/usr/local/share/npm/lib/node_modules
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin
export PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

if which brew > /dev/null; then
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi
export V8_HOME=/usr/local/Cellar/v8/3.21.17/bin
export SPIDERMONKEY_HOME=/usr/local/Cellar/spidermonkey/1.8.5/bin

export PATH=$PATH:$HOME/.rbenv/shims
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export MAKEFLAGS="-j 8"

if which av > /dev/null; then eval "$($HOME/code/av/bin/av init -)"; fi
if which fasd > /dev/null; then eval "$(fasd --init auto)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi


alias tg='tugboat'
alias gusto='gusteau'
alias gu='gusteau'

function dash() {
  open dash://$1
}

# qwandry open gem with vim
alias qw='qw -e vim'

function gh() {
  open "https://github.com/search?q=$1&ref=commandline"
}

function dg(){
  open "https://duckduckgo.com/?q=$1"
}

function so(){
  open "http://stackoverflow.com/?q=$1"
}

alias va='vagrant'

# Task management
# alias g='python ~/code/t/t.py --task-dir ~/ --list GAMES.txt'
# alias t='python ~/code/t/t.py --task-dir . --list TODO.txt'
# alias -- -t='t -f'
alias t=task

alias nv='cd ~/Documents/Notational\ data/; vim .'

alias http='python -m SimpleHTTPServer'
alias vundle='vim-update-bundles'
alias bx='bundle exec'
alias bo='bundle open'

alias cb='`git rev-parse --abbrev-ref HEAD`'
alias g='git status'
alias gco='git checkout'
alias gd='git diff'
alias gp='git push'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gb='git branch -v'
# alias gb='git branch --all | cut -c 3- | rev | cut -d "/" -f 1 | rev | selecta | xargs git checkout'
alias gc='git commit'
alias gca='git commit -a'
alias gff='git merge --ff-only origin/`git rev-parse --abbrev-ref HEAD`'
alias git='hub'
alias gl='git log'
alias gx='gitx'

alias o='open'

alias rst='touch tmp/restart.txt'
alias reload='source ~/.bash_profile'
alias reloada='source ~/.aliases.bash'

alias ec="vim ~/.lein/profiles.clj"
alias ea="vim ~/.aliases.bash"
alias ev="vim ~/.vimrc"
alias eg="vim ~/.rbenv/default-gems"
alias ep="vim ~/.bash_profile"
alias ei="vim ~/.inputrc"
alias et='vim ~/.tmux.conf'

# osx
alias lt='open ~/Applications/LightTable/LightTable.app'
alias el='vim ~/ledger/money.ledger'
alias lr='ledger'

alias p='powify'
alias tailf='tail -f'

export EDITOR="vim"
export MY_RUBY_HOME=/usr

alias lss='du -sh * |sort -hr'


export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

alias lrm='sudo launchctl unload -w'

function pg-on() {
  tmux -2 new-session -d -s "postgresql"
  # tmux new-window -t "postgres":0 -n "Server"
  tmux send-keys -t "postgresql" "postgres -D /usr/local/var/postgres" C-m
}
function pg-off() {
  tmux send-keys -t "postgresql" C-c C-d
}
alias em='vim ~/.live-packs/orca-pack/init.el'
alias emm='vim ~/.emacs-live.el'

alias ee='emacs'

alias vpn='while true; do ssh -N -D 127.0.0.1:1080 dorp; done'

alias ls='ls --color'
alias sl='ls --color'

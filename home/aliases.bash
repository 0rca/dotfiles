## .zshrc.local
# paths setup
# export EDITOR='mvim --remote-silent'
export EDITOR='vim'
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
export JSC_HOME=/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
export GOPATH=$HOME/code/go
export ANDROID_HOME=$HOME/code/android/sdk
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH=/usr/local/share/npm/lib/node_modules
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin
export PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.rbenv/shims
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH="$HOME/Library/Haskell/bin:$PATH"
export TODO_TXT_PATH=$HOME/.todo.txt
export PATH=$PATH:$HOME/.local/bin

if which brew > /dev/null; then
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi
export V8_HOME=/usr/local/Cellar/v8/3.21.17/bin
export SPIDERMONKEY_HOME=/usr/local/Cellar/spidermonkey/1.8.5/bin

export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export MAKEFLAGS="-j 8"

eval "$(fasd --init auto)"
eval "$(rbenv init - --no-rehash)"

# qwandry open gem with vim
alias qw="qw -e '$EDITOR'"

alias vundle='vim-update-bundles'
alias vun='vundle -n'
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
alias gb='git branch | cut -c 3- | selecta | xargs git checkout'
alias gm='git branch | cut -c 3- | selecta | xargs -I {} git merge {} --no-ff'
alias gc='git commit'
alias gca='git commit -a'
alias gff='git merge --ff-only origin/`git rev-parse --abbrev-ref HEAD`'
alias git='hub'
alias gl='git log'
alias gx='gitx'

alias o='open'

alias rst='touch tmp/restart.txt'
alias reload='source ~/.bash_profile'
alias ra='source ~/.aliases.bash'

alias e=$EDITOR
alias ec="$EDITOR ~/.lein/profiles.clj"
alias ea="$EDITOR ~/.aliases.bash"
alias ev="$EDITOR ~/.vimrc"
alias eg="$EDITOR ~/.rbenv/default-gems"
alias ep="$EDITOR ~/.bash_profile"
alias ei="$EDITOR ~/.inputrc"
alias et="$EDITOR ~/.tmux.conf"
alias es="$EDITOR ~/.ssh/config"

# osx
alias lt='/Applications/LightTable/light'
alias el="$EDITOR ~/ledger/money1.ledger"
alias lr='ledger'

alias p='powify'
alias tailf='tail -f'

export MY_RUBY_HOME=/usr

alias lss='du -sh * |sort -hr'

export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

alias lrm='sudo launchctl unload -w'

function pg-up() {
  TMUX= tmux -2 new-session -d -s "postgresql"
  # tmux new-window -t "postgres":0 -n "Server"
  TMUX= tmux send-keys -t "postgresql" "postgres -D /usr/local/var/postgres9.3" C-m
}

function pg-down() {
  tmux send-keys -t "postgresql" C-c C-d
}

function tmux-run() {
  TMUX= tmux -2 new-session -d -s $1
  TMUX= tmux send-keys -t $1 $@ C-m
}

alias em="$EDITOR ~/.live-packs/orca-pack/init.el"
alias emm="$EDITOR ~/.emacs-live.el"

alias ee='emacsclient -t'

alias vpn='while true; do ssh -N -D 127.0.0.1:1080 wiki; done'

alias ls='ls --color'
alias sl='ls --color'
alias la='ls -a'

function tm {
  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
}

alias ..='cd ..'
alias ....='cd ../..'

alias rmrf='rm -rf'

alias raek='rake'

function bro() {
  brew info $1 | sed -n 2p | xargs open
}


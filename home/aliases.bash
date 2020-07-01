# aliases.bash

alias bo='bundle open'
alias bx='bundle exec'
alias c=cli
alias cb='`git rev-parse --abbrev-ref HEAD`'
alias code.="code ."
alias dns='sudo dnsmasq -k'
alias e.='e .'
alias e=$EDITOR
alias ea="$EDITOR ~/.aliases.bash"
alias eal="$EDITOR ~/.config/alacritty/alacritty.yml"
alias ec="$EDITOR ~/.lein/profiles.clj"
alias ec="$EDITOR ~/.local/bin/cli"
alias ei="$EDITOR ~/.inputrc"
alias el="$EDITOR ~/Documents/Ledger/2018.ledger"
alias ep="$EDITOR ~/.bash_profile"
alias es="$EDITOR ~/.ssh/config"
alias et="$EDITOR ~/.tmux.conf"
alias ev="$EDITOR ~/.vimrc"
alias g='git status'
alias gb='git branch -v'
alias gbf='gbr | fzf | xargs git checkout'
alias gbi='git branch | cut -c 3- | fzf | xargs git checkout'
alias gbr='git for-each-ref --count=15 --sort=-committerdate refs/heads/ --format="%(refname:short)"'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gff='git merge --ff-only origin/`git rev-parse --abbrev-ref HEAD`'
alias gfff='gf && gff'
alias git=hub
alias gl='git log --graph --oneline --decorate'
alias gmi='git branch | cut -c 3- | fzf | xargs -I {} git merge {} --no-ff'
alias gp='git push'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias idea='open -a "IntelliJ IDEA CE"'
alias lent='lentil . -a ex%rb -x test -f comp'
alias lr='ledger -f ~/Documents/Ledger/2018.ledger'
alias mps="mix phx.server"
alias mt="mix test"
alias mf="mix test --failed"
alias ng='ngrok tls -region=ap -hostname="*.${BC_DEV_DOMAIN}" 4443'
alias nowatch="export BC_DEV_NO_WATCH_ASSETS=1"
alias o='open'
alias pgup="postgres -D /usr/local/var/postgres10.1"
alias ra='source ~/.aliases.bash'
alias rp='source ~/.bash_profile'
alias st.='open -a SourceTree .'
alias st='open -a SourceTree'
alias tailf='tail -f'
alias uf='(cd ../.. && mix format)'
alias xee='open -a "Xee³"'
alias time='/usr/bin/time'
alias commit="vim :Git"
alias mecast="sudo ifconfig en0 ether f4:f5:d8:0f:e6:ae"
alias meme="sudo ifconfig en0 ether 80:35:c1:35:6d:cb"
alias nocast="sudo ifconfig en0 ether 28:cf:e9:19:a0:9f"
alias r=ranger
alias sbf="stack build --fast"
alias restart_camera="sudo killall VDCAssistant"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias sleepless="pmset -g assertions | egrep '(PreventUserIdleSystemSleep|PreventUserIdleDisplaySleep)'"
alias post="curl -X POST"
alias vim=nvim
alias gvim=neovide
alias testmobi="source .mobi && stack exec bluecode-test --"
alias testmobir="stack build --fast && source .mobi && stack exec bluecode-test --"

function youtube-au() {
  youtube-dl -x "$1" --audio-format mp3
}

function dark() {
  export DARK_MODE=$(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode=true")
}

function light() {
  export DARK_MODE=$(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode=false")
}

# fj - changing directory with fasd
fj() {
  local dir
  dir=$(fasd -Rdl | fzf --no-sort +m) && cd "$dir"
}

function clip() {
  [ -t 0 ] && pbpaste || pbcopy
}

function gcoi() {
  git checkout `git branch --list --no-color | cut -c 3- | fzf -q $1`
}

function gbdi() { # git branch -D interactively
  git branch -d `git branch --list --no-color | cut -c 3- | fzf -q $1`
}

function recode() {
  ffmpeg -i "$1" "_$1"
}


eval "$(rbenv init - zsh --no-rehash)"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="joe"

alias b='bundle exec'
alias bi='bundle install'
alias rsv='bin/rails server'
alias rcs='bin/rails console'
alias ms='bundle exec middleman server'
alias mb='bundle exec middleman build --no-clean'

alias canary="open -a \"Google Chrome Canary\" --args --disable-web-security"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mongodb="mongod --fork --dbpath /usr/local/var/log/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --logappend"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-flow ruby rails)

source $ZSH/oh-my-zsh.sh

export PGDATA="/usr/local/var/postgres"
export PATH="/usr/local/heroku/bin:/usr/local/sbin:$PATH"
export PATH=${PATH}:/Developer/adt-bundle/sdk/platform-tools:/Developer/adt-bundle/sdk/tools
export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR='vim'

# https://gist.github.com/nicholascloud/5372443#comment-815301
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

export PG_USER=postgres

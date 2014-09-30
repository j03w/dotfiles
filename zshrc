eval "$(rbenv init - zsh --no-rehash)"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="joe"

alias canary="open -a \"Google Chrome Canary\" --args --disable-web-security"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mongodb="mongod --fork --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --logappend"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"

alias rsp="rails server --binding 127.0.0.1"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-flow ruby rails bundler)

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

export PATH=$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:$PATH
eval "$(rbenv init - --no-rehash zsh)"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="joe"

alias pg_start="pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/server.log start"
alias pg_stop="pg_ctl -D /usr/local/pgsql/data stop -s -m fast"
alias mongodb="mongod --fork --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --logappend"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias du1="du -d1 -h"
alias tb="tar -jcvf"
alias tg="tar -zcvf"
alias utb="tar -zxvf"
alias utg="tar -jxvf"
alias ll="ls -alh"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ruby rails bundler)

source $ZSH/oh-my-zsh.sh

export PGDATA="/usr/local/var/postgres"
export PATH="/usr/local/heroku/bin:/usr/local/sbin:$PATH"
export PATH="${PATH}:/usr/local/opt/python/libexec/bin"
export PATH="${PATH}:/Applications/Android Studio.app/sdk/tools"
export PATH="$PATH:/usr/local/opt/mysql@5.6/bin"
export EC2_SSH_KEY_PATH="/Users/joe/.ssh/amaysim-joewongchanglor.pem"

export EDITOR='vim'

# https://gist.github.com/nicholascloud/5372443#comment-815301
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

export PG_USER=postgres

# https://gist.github.com/TheFox/adf1c97916ea0e2d5083
alias gitclearcache='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'

eval "$(rbenv init - zsh --no-rehash)"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="joe"

alias canary="open -a \"Google Chrome Canary\" --args --disable-web-security"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mongodb="mongod --fork --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --logappend"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"
alias rsl="rails server --binding 127.0.0.1"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias julia="/Applications/Julia-0.3.2.app/Contents/Resources/julia/bin/julia"
alias du1="du -d1 -h"
alias ipyt="~/anaconda/bin/ipython qtconsole"
alias tb="tar -jcvf"
alias tg="tar -zcvf"
alias utb="tar -zxvf"
alias utg="tar -jxvf"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-flow ruby rails bundler)

source $ZSH/oh-my-zsh.sh

export PGDATA="/usr/local/var/postgres"
export PATH="/usr/local/heroku/bin:/usr/local/sbin:$PATH"
export PATH="${PATH}:/Applications/Android Studio.app/sdk/tools"
export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR='vim'

# https://gist.github.com/nicholascloud/5372443#comment-815301
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

export PG_USER=postgres

# https://gist.github.com/TheFox/adf1c97916ea0e2d5083
alias gitclearcache='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'

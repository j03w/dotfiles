# init rbenv, comment out or remove if not using rbenv
eval "$(rbenv init - --no-rehash zsh)"

# init nvm, comment out or remove if not using nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# oh-my-zsh stuff
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="joe"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ruby rails bundler aws)

source $ZSH/oh-my-zsh.sh

# aliases
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"
alias ll="ls -lah"
alias du1="du -d1 -h"
alias tar_bzip="tar -jcvf"
alias tar_gzip="tar -zcvf"
alias untar_bzip="tar -zxvf"
alias untar_gzip="tar -jxvf"

# PATH and ENV stuff
export PG_USER=postgres
export PGDATA="/usr/local/var/postgres"

export PATH="/usr/local/sbin:$PATH"

export EDITOR='vim'

# https://gist.github.com/nicholascloud/5372443#comment-815301
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

# https://gist.github.com/TheFox/adf1c97916ea0e2d5083
alias gitclearcache='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'

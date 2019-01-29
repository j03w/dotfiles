export PATH=$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:$PATH
eval "$(rbenv init - --no-rehash zsh)"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="joe"

alias mongodb="mongod --fork --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --logappend"
alias gemimplode="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias du1="du -d1 -h"
alias tb="tar -jcvf"
alias tg="tar -zcvf"
alias utb="tar -zxvf"
alias utg="tar -jxvf"
alias ll="ls -alh"
alias git-prune-local="branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -df"
alias gpl="git-prune-local"

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

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

export EDITOR='nvim'

# https://gist.github.com/nicholascloud/5372443#comment-815301
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

export PG_USER=postgres

# https://gist.github.com/TheFox/adf1c97916ea0e2d5083
alias gitclearcache='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'

export GOPATH=$HOME/Workspace/gohome
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

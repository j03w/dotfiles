eval "$(rbenv init - --no-rehash)"

export PATH="/usr/local/heroku/bin:/usr/local/sbin:$PATH"
export PGDATA="/usr/local/var/postgres"
export PATH=${PATH}:/Developer/adt-bundle/sdk/platform-tools:/Developer/adt-bundle/sdk/tools

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias b='bundle exec'
alias bi='bundle install'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rmi='bundle exec rake db:migrate db:test:clone'
alias ms='bundle exec middleman server'
alias mb='bundle exec middleman build --no-clean'
alias canary="open -a \"Google Chrome Canary\" --args --disable-web-security"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

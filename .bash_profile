if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias n="nano -w"
alias passgen="openssl rand -base64 10"
alias df="df -hP"
alias du="du -h"
alias l="ls -lhtr"
alias gpom="git pull origin master"
alias gs="git status"
alias c="clear"

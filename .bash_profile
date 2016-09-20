if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias n="nano -w"
alias v="vim"
alias passgen="openssl rand -base64 10"
alias df="df -hP"
alias du="du -h"
alias ll="ls -ltra"
alias gp="git pull"
alias c="clear"
alias gs="git status"
alias b="cd .."
alias jps="jps -lvm"
alias taildir='watch "ls -lrt | tail -10"'
alias kne='knife node edit'
alias kns='knife node show -Fj'
alias knl='knife node list'
alias krl='knife role list'
alias krs='knife role show -Fj'
alias wipedns='sudo killall -HUP mDNSResponder'

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PATH="/usr/local/sbin:$PATH"

export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export PATH=/usr/local/bin:/usr/local/sbin:~/go/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export XDG_CONFIG_HOME=~/.config

source ~/opsenv/bin/activate

[ -f "$HOME/.profile" ] && source "$HOME/.profile"
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
/Users/blieberman/opsenv/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

ssh-add -K > /dev/null 2>&1

alias nano="/usr/local/bin/nano"
alias n="nano -w"
alias v="vim"
alias passgen="openssl rand -base64 12"
alias df="df -hP"
alias du="du -h"
alias ll="ls -ltra"
alias gp="git pull"
alias c="clear"
alias gs="git status"
alias gpom="git pull origin master"
alias b="cd .."
alias grep="ggrep --color=auto"
alias jps="jps -lvm"
alias taildir='watch "ls -lrt | tail -10"'
alias wipedns='sudo killall -HUP mDNSResponder'
alias pyclean="find . -name \*.pyc -o -name \*.pyo -o -name __pycache__ -delete"

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ping
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" telnet
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" nmap
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" traceroute
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" host

export SVN_EDITOR=nano
export EDITOR=nano
ulimit -S -n 2048
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
        # load config file
    else
        tmux attach-session -t "$ID" # if available attach to it
        tmux source ~/.tmux.conf
    fi
fi

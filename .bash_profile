if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias nano='nano -w'
alias passgen='openssl rand -base64 10'

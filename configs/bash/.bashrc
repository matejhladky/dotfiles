[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sudo="sudo "
alias vi='nvim'

c_cyan='\e[0;96m'
c_reset='\e[0m'
PS1="\[\\033[38;5;153m\]\u@\h: \w $ \[\\033[0m\]"

set -o vi

[ -f "/home/mateo/.ghcup/env" ] && source "/home/mateo/.ghcup/env" # ghcup-env

export EDITOR='nvim'

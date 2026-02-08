export EDITOR=nvim

set -o vi


# prompt
PS1="\[\033[38;5;153m\]mateo@debian: \w\[\033[0m\] "


# aliases
alias vi='nvim'
alias vim='nvim'
alias copy='xclip -selection clipboard'
alias kctl='kubectl'


# eternal bash history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# enable bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# per-machine tweaks (gitignored)
if [ -f "$HOME/.bashrc.local" ]; then
	source "$HOME/.bashrc.local"
fi

. "$HOME/.local/bin/env"

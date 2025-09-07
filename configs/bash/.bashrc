export EDITOR=nvim

set -o vi


# Prompt
PS1="\[\033[38;5;153m\]mateo@debian: \w\[\033[0m\] "


# Aliases
alias vi='nvim'
alias vim='nvim'


# Eternal bash history.
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# Per-machine tweaks (gitignored)
if [ -f "$HOME/.bashrc.local" ]; then
	source "$HOME/.bashrc.local"
fi

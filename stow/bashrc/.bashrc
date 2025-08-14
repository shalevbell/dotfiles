# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#Aliases / Functions
for file in ~/._*functions; do
  [[ -f "$file" ]] && source "$file"
done

[ -f ~/.work ] && source ~/.work

alias ll='ls -al'
alias python="python3"
alias g="git"
alias gc="cd ~/git && g clone"
alias myip="curl ifconfig.me"

#fzf
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git/*'"
eval "$(fzf --bash)"

skctl

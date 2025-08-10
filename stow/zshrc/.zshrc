
HISTSIZE=10000
SAVEHIST=50000

#Ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting aws brew starship docker fzf)
source $ZSH/oh-my-zsh.sh

#Aliases
source ~/.personalFunctions

alias ll='ls -al'
alias python="python3"
alias g="git"
alias gc="cd ~/git && g clone"
alias myip="curl ifconfig.me"

#Work related functions
[ -f ~/.work ] && source ~/.work

#fzf
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git/*'"
source <(fzf --zsh)

#starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"


# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS        # Don't record duplicate entries
setopt HIST_FIND_NO_DUPS       # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE       # Don't record commands starting with space
setopt SHARE_HISTORY           # Share history between sessions
setopt APPEND_HISTORY          # Append to history file
setopt INC_APPEND_HISTORY      # Write to history file immediately

#Ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting aws brew starship docker fzf)
source $ZSH/oh-my-zsh.sh

#Aliases / Functions
# Source all function files
for file in ~/._*functions; do
  [[ -f "$file" ]] && source "$file"
done

# Refresh fzf directory cache in the background on interactive shell start
if [[ -o interactive ]] && typeset -f _fzf_dirs_rebuild >/dev/null; then
  (_fzf_dirs_rebuild &) >/dev/null 2>&1
fi

# Source work-specific config if it exists
[[ -f ~/.work ]] && source ~/.work

# Reload shell configuration
alias reload='exec zsh'

#fzf
# Use fd if available, otherwise fall back to find
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
else
  export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git/*' -not -path '*/node_modules/*' -not -path '*/.venv/*'"
fi
source <(fzf --zsh)

#starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

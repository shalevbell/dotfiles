#!/usr/bin/env bash
set -e

echo "Starting Homebrew package installation"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/Brewfile"

if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed yet."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit 1
fi

if [ ! -f "$BREWFILE" ]; then
    echo "Error: Brewfile not found at $BREWFILE"
    exit 1
fi

echo "Using Brewfile: $BREWFILE"
echo ""

echo "Updating Homebrew"
brew update

echo ""
echo "Installing packages from Brewfile"
brew bundle --file="$BREWFILE"

echo ""
echo "Installing Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed, skipping."
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo ""
echo "Installing Oh My Zsh custom plugins"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already installed, skipping."
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting already installed, skipping."
fi

echo ""
echo "Installation complete!"
echo ""
echo "To verify installations, run:"
echo "brew bundle check --file=$BREWFILE"

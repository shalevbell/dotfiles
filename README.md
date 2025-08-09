# Dotfiles

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to manage my symlinks and dotfiles.

## Setup

To symlink all dotfiles in the `stow` directory to home:

```bash
cd stow
stow -v --target="$HOME" .
```


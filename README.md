# Dotfiles

Using [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks.

## Setup

To symlink all dotfiles in the `stow` directory to home:

```bash
cd stow
stow --target="$HOME" *
```

To symlink a single package reference it directly:

```bash
cd stow
stow --target="$HOME" zshrc
```

To remove all symlinks:

```bash
cd stow
stow --target="$HOME" -D *
```

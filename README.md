# Dotfiles

## Install

**Requirements**
- `git`
- `stow`

**Steps**
1. Close this repository
2. `cd` into the top level directory
3. Use `stow` to create symlinks
```
stow -t $HOME */    # Symlink everything
stow -t $HOME nvim  # Just create nvim symlinks
```

## Brew

Formulae and Casks listed in `brew/Brewfile` can be installed with Homebrew's [bundle](https://docs.brew.sh/Manpage#bundle-subcommand) subcommand

## Reference

Here are some dotfiles I've taken inspiration from:

- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- [nickjj/dotfiles](https://github.com/nickjj/dotfiles)
- [ChristianChiarulli/Machfiles](https://github.com/ChristianChiarulli/Machfiles)


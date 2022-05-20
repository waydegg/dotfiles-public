# Dotfiles

My personal dotfiles.

## On a new machine

```
# Install all Brew dependencies
brew bundle 

# Create symlinks for all dotfiles with Stow
stow -t $HOME */

# Make Fish the default shell
chsh -s /opt/homebrew/bin/fish

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Open Neovim and install all plugins
:PlugInstall
```


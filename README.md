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
```

Alacritty can now be built and installed from source.

```
# Install alacritty
ghq get alacritty/alacritty
cd $HOME/ghq/github.com/alacritty/alacritty

# Build the app
make app
cp -r target/release/osx/Alacritty.app /Applications/

# Run post build commands
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
```

Open up NeoVim and install plugins with `:PlugInstall`.

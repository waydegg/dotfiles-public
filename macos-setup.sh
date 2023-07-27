#!/usr/bin/env bash

# ----- Install packages ---------------------------------------------------------------

# Install homebrew packages
brew install bat direnv docker docker-compose exa fd fish fnm fx fzf ghq go hatch htop \
  httpie iredis jq lua node pandoc pipx pyenv redis ripgrep sqlfluff stow \
  stylua tmux tree universal-ctags yarn saulpw/vd/visidata git-delta wget gh groff \

# Install Python 3.10
pyenv install 3.10.4

# Install Node v18
fnm install v18.16.0
fnm default v18.16.0

# Install homebrew casks
brew install --casks ngrok alt-tab

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-macos.tar.gz -P ~/Downloads
sudo tar -xf ~/Downloads/nvim-macosx.tar.gz -C /opt

# Install pip(x) packages
pipx install black \
  && pipx install isort \
  && pipx install invoke \
  && pipx install git+https://github.com/waydegg/autoflake \
  && pipx install linode-cli --pip-args="pip install boto" \
  && pipx install pgcli
  
# Install (global) npm packages
sudo npm install -g \ 
  @taplo/cli@0.5.2 \
  prettier@2.8.0 \
  @trivago/prettier-plugin-sort-imports@4.0.0 \
  sql-formatter

# Install bun
curl -fsSL https://bun.sh/install | bash


# ----- Setup git -------------------------------------------------------------

git config --global user.name "Wayde Gilliam"
git config --global user.email "waydegilliam@gmail.com"
git config --global init.defaultBranch master
git config --global alias.root "rev-parse --show-toplevel"
git config --global core.pager delta
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Solarized (light)"


# ----- Setup Fish Shell ---------------------------------------------------------------

# Install Fisher (plugin manager)
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install plugins
fish -c "fisher install jethrokuan/z PatrickF1/fzf.fish IlanCosman/tide@v5.0.1"

# Remove conflicting fish files (in preparation for Stow)
rm ~/.config/fish/config.fish ~/.config/fish/functions/fish_mode_prompt.fish

# Stow fish
stow -d $HOME/ghq/github.com/waydegg/dotfiles-public -t $HOME fish

# Enable vi mode for fish
fish -c "fish_vi_key_bindings"

# ----- Setup Neovim ----------------------------------------------------------

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install language servers
npm install -g \
  pyright \
  typescript-language-server \
  vim-language-server \
  vscode-langservers-extracted \
  vls
brew install lua-language-server rust-analyzer


# ----- Final steps -----------------------------------------------------------

# Remove conflicting fish files (in preparation for Stow)
rm ~/.config/fish/config.fish ~/.config/fish/functions/fish_mode_prompt.fish

# Stow everything
stow -d ghq/github.com/waydegg/dotfiles-public -t $HOME \
  bat direnv fish git ipython npm nvim pgcli prettier stylua tmux

# Enable vi mode for fish
fish -c "fish_vi_key_bindings"

# Change default shell to fish
## TODO: Add fish path to /etc/shells
chsh -s $(which fish)

# Setup neovim venv (TODO: test that this works)
~/.pyenv/versions/3.10.4/bin/python -m venv ~/.config/nvim/venv
~/.config/nvim/venv/bin/pip install -r ~/.config/nvim/requirements.txt

# Reboot
sudo reboot


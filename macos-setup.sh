#!/usr/bin/env bash

# ----- Install packages ---------------------------------------------------------------

# Install homebrew packages
brew install bat direnv docker docker-compose exa fd fish fnm fx fzf ghq go hatch htop \
  httpie iredis jq lua node pandoc pipx pyenv redis ripgrep sqlfluff stow \
  stylua tmux tree universal-ctags yarn saulpw/vd/visidata git-delta wget gh

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
sudo npm install -g @taplo/cli@0.5.2 prettier@2.8.0 \
  @trivago/prettier-plugin-sort-imports@4.0.0

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

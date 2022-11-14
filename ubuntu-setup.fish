# Install dotfiles
ghq get waydegg/dotfiles-public


# ----- Setup Fish Shell ------------------------------------------------------

# Install Fisher (plugin manager)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install plugins
rm ~/.config/fish/fish_plugins ~/.config/fish/config.fish
stow -d $HOME/ghq/github.com/waydegg/dotfiles-public -t $HOME fish 
fisher update

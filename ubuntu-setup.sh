# Update, upgrade, and reboot (as root user)
apt update && apt upgrade -y
reboot

# ----- Setup -----------------------------------------------------------------
export REMOTE_USER=waydegg

# Create a new user
sudo adduser $REMOTE_USER

# Add user to sudoers group
usermod -aG sudo $REMOTE_USER

# Copy SSH auth files from root to new user
mkdir /home/$REMOTE_USER/.ssh
cp -Rfv /root/.ssh /home/$REMOTE_USER/
chown -Rfv $REMOTE_USER:$REMOTE_USER /home/$REMOTE_USER/.ssh


# ----- Install and setup Docker ----------------------------------------------

# Install Docker dependencies
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the 'stable' Docker repository
bash -c "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu/ \$(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"

# Install Docker Engine, Docker Compose, and other dependencies
sudo apt update
sudo apt install -y docker-ce docker-compose docker-ce-cli containerd.io

# Configure Docker to start on boot
sudo systemctl enable docker
sudo systemctl enable containerd

# Create docker group and add the current user to it
sudo groupadd docker
sudo usermod -aG docker $USER

# Reboot
sudo reboot


# ----- Linuxbrew ------------------------------------------------------------

# Install
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to PATH
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' \
  >> ~/.config/fish/config.fish
  
# Install dependencies for Linuxbrew
sudo apt-get install -y build-essential


# ----- Download dotfiles and install Brewfile --------------------------------

# Clone public dotfiles repository
git clone https://github.com/waydegg/dotfiles-public

# Install brew dependencies
brew bundle --verbose --file $HOME/dotfiles-public/Brewfile.remote


# ----- Setup Fish Shell ------------------------------------------------------

# Install Fisher (plugin manager)
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install plugins
rm ~/.config/fish/fish_plugins \
  && stow -d $HOME/dotfiles-public -t $HOME --ignore '\.fish' fish \
  && fish -c "fisher update"

# Configure prompt
fish -c "echo 1 1 1 1 1 1 1 1 1 y | tide configure >/dev/null"

# Stow the rest of fish files
rm $HOME/.config/fish/config.fish $HOME/.config/fish/functions/fish_mode_prompt.fish \
  && stow -d $HOME/dotfiles-public -t $HOME fish

# Enable vi mode
fish -c "fish_vi_key_bindings"

# Add completions for Docker and FNM
curl -o $HOME/.config/fish/completions/docker.fish \
  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish
fnm completions --shell=fish > ~/.config/fish/completions/fnm.fish


# ----- Setup Neovim ----------------------------------------------

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Stow Neovim files
stow -d $HOME/dotfiles-public -t $HOME nvim


# ----- Setup CLI tools -------------------------------------------------------

# Stow everything 
stow -d $HOME/dotfiles-public -t $HOME bat direnv git ipython pgcli pyenv stylua tmux

# Install pip/pipx tools
pip install --upgrade pip
pipx install black
pipx install isort
pipx install invoke
pipx install git+https://github.com/waydegg/autoflake

# ----- Final steps -----------------------------------------------------------

# Make Fish the default shell
command -v fish | sudo tee -a /etc/shells 
sudo chsh -s "$(command -v fish)" "${USER}"

# Reboot
sudo reboot


# Update, upgrade, and reboot (as root user)
apt update && apt upgrade -y
reboot

# ----- (Optional) Add remote user -----------------------------------------------------
export REMOTE_USER=waydegg

# Create a new user
sudo adduser $REMOTE_USER

# Add user to sudoers group
usermod -aG sudo $REMOTE_USER

# Copy SSH auth files from root to new user
mkdir /home/$REMOTE_USER/.ssh
cp -Rfv /root/.ssh /home/$REMOTE_USER/
chown -Rfv $REMOTE_USER:$REMOTE_USER /home/$REMOTE_USER/.ssh


# ----- (Optional) Install and setup SSH server ---------------------------------------

# Install SSH server
sudo apt install -y openssh-server

# Enable SSH on the firewall
sudo ufw allow ssh


# ----- Install and setup Docker ----------------------------------------------

# Install Docker dependencies
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the 'stable' Docker repository
bash -c "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu/ \$(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"

# Install Docker Engine, Docker Compose, and other dependencies
sudo apt update && \
  sudo apt install -y docker-ce docker-compose docker-ce-cli containerd.io

# Configure Docker to start on boot
sudo systemctl enable docker
sudo systemctl enable containerd

# Create docker group and add the current user to it
sudo groupadd docker
sudo usermod -aG docker $USER

# Reboot
sudo reboot

# ----- Install packages --------------------------------------------------------------

# Install packages (available via apt)
sudo apt install -y tmux speedtest-cli fd-find visidata bat direnv exa fish golang-go \
  stow postgresql npm python3-pip python3-venv ripgrep tree fzf htop

# Add packages to $PATH (where nessesary)
mkdir ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s $(which batcat) ~/.local/bin/bat
echo 'export PATH="${HOME}/.local/bin:${PATH}"' >> ~/.bashrc

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Install pyenv
curl https://pyenv.run | bash

# Install ghq
wget https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_linux_amd64.zip -P ~/Downloads
unzip ~/Downloads/ghq_linux_amd64.zip -d ~/Downloads
sudo cp Downloads/ghq_linux_amd64/ghq /usr/local/bin

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz -P ~/Downloads
sudo tar -xf ~/Downloads/nvim-linux64.tar.gz -C /opt

# Install pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Install pip(x) packages
pipx install black \
  && pipx install isort \
  && pipx install invoke \
  && pipx install git+https://github.com/waydegg/autoflake \
  && pipx install linode-cli --pip-args="pip install boto" \
  && pipx install pgcli \
  && pipx install sqlfluff \
  && pipx install hatch

# Install (global) npm packages
sudo npm install -g @taplo/cli prettier @johnnymorganz/stylua-bin yarn

# Install fx
wget https://github.com/antonmedv/fx/releases/download/24.0.0/fx_linux_amd64 -P ~/Downloads
sudo cp Downloads/fx_linux_amd64 /usr/local/bin/fx
sudo chmod +x /usr/local/bin/fx

# Delete all files in /Downloads
rm -r ~/Downloads/*

# ----- Setup Fish Shell ------------------------------------------------------

# Install Fisher (plugin manager)
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install plugins
fish -c "fisher install jethrokuan/z PatrickF1/fzf.fish IlanCosman/tide@v5.0.1"

# Configure prompt
fish -c "echo 1 1 1 1 1 1 1 1 1 y | tide configure >/dev/null"

# Add completions for Docker and FNM
curl -o $HOME/.config/fish/completions/docker.fish \
  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish
fnm completions --shell=fish > ~/.config/fish/completions/fnm.fish


# ----- Setup Neovim ----------------------------------------------

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# ----- Final steps -----------------------------------------------------------

# Stow everything
stow -d $HOME/ghq/github.com/waydegg/dotfiles-public -t $HOME \
  bat direnv fish git ipython nvim pgcli pyenv stylua tmux

# Enable vi mode for fish
fish -c "fish_vi_key_bindings"
#
# Change default shell to fish
chsh -s $(which fish)

# Reboot
sudo reboot


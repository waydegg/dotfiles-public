## Docker

# Install Docker dependencies
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the 'stable' Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine and other dependencies
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Configure Docker to start on boot
sudo systemctl enable docker
sudo systemctl enable containerd


## Linuxbrew

# Install
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to PATH
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install dependencies
sudo apt-get install -y build-essential


## Brewfile

brew install ghq fish stow direnv pyenv fnm tree exa bat

## Fish shell setup

# Install Fisher (plugin manager)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Stow only plugins file 
stow -t $HOME --ignore '\.fish'  fish

# Install plugins (select '1' for all of the tide prompt q's)
fisher update

# Stow the rest of fish files
stow -t $HOME fish

# Enable vi mode
fish_vi_key_bindings


## Neovim

# Install neovim
brew install nvim 

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install neovim dependencies
brew install stylua





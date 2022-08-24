# ===== Environment Variables =================================================
# Disable Fish greeting
set fish_greeting ""

# Add Homebrew to PATH
switch (uname)
  case Darwin
    set -x PATH /opt/homebrew/bin $PATH
  case Linux
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Set default editor to Neovim
set -x EDITOR nvim

# Tide prompt
set -g tide_git_color_branch 008700
set -g tide_git_color_stash 008700
set -g tide_git_color_untracked 008700
set -g tide_character_color 008700
set -g tide_character_vi_icon_default ❯
set -g tide_character_vi_icon_replace ❯
set -g tide_character_vi_icon_visual ❯
set -g tide_right_prompt_items status cmd_duration context jobs virtual_env

# Set IPython directory
set -x IPYTHONDIR $HOME/.config/ipython

# Lazygit config directory
set -x CONFIG_DIR $HOME/.config/lazygit

# Rustup and Cargo config directories, add Cargo to PATH
set -x RUSTUP_HOME $HOME/.config/rustup
set -x CARGO_HOME $HOME/.config/cargo
set -x PATH $HOME/.config/cargo/bin $PATH

# Direnv
set -x DIRENV_LOG_FORMAT ""

# Add $HOME/.local/bin to path (pipx puts executables here)
if type -q pipx
  set -x PATH $HOME/.local/bin $PATH
end

# Pyenv config directory
set -x PYENV_ROOT $HOME/.config/pyenv

# ===== Aliases ================================================================
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias tree "tree -l -C -a -I '.git' -I 'venv' -I '__pycache__' -I '*.egg-info' -I '*.ipynb_checkpoints' -I 'node_modules'"

alias g git
alias gs "git status"
alias ga "git add"
alias gd "git diff --name-only --diff-filter=d | xargs bat --diff"
alias gc "git commit -m"
alias gw "git worktree"

alias t tmux
alias ts "tmux ls"
alias tk "tmux kill-session -t"
alias tks "tmux kill-server"

alias p python
alias python python3
alias pip "python -m pip"
alias venv "python -m venv"

alias d docker
alias dc docker-compose
alias dcl "docker ps -a"
alias dcp "docker container prune"
alias di "docker image"
alias dil "docker image ls"
alias dv "docker volume"
alias dvl "docker volume ls"
alias dn "docker network"
alias dnl "docker network ls"

alias cat bat
alias nvm fnm
alias vim nvim
alias vi nvim
alias c clear
alias logout exit

# ===== Keybinds ==============================================================
# Search through command history
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

# Exit insert mode 
bind -M insert -m default jk force-repaint

# ===== Auto-running Functions ================================================
function __check_venv --on-variable PWD --description 'Source venv (if exists) on directory change'
  status --is-command-substitution; and return
  if test -d venv
    source ./venv/bin/activate.fish
  end
end

# ===== Tool setup ============================================================
# FNM
if type fnm -q && status is-interactive 
  fnm env --shell fish --use-on-cd | source
end

# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Direnv
direnv hook fish | source

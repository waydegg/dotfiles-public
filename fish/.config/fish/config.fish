# ===== Environment Variables =================================================
# Disable Fish greeting
set fish_greeting ""

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

# Rustup and Cargo config directories, add Cargo to PATH
set -x RUSTUP_HOME $HOME/.config/rustup
set -x CARGO_HOME $HOME/.config/cargo
set -x PATH $HOME/.config/cargo/bin $PATH

# direnv
set -x DIRENV_LOG_FORMAT ""

# Add $HOME/.local/bin to path (pipx puts executables here)
set -x PATH $HOME/.local/bin $PATH

# pip
set -x PIP_DISABLE_PIP_VERSION_CHECK 1

# use bat for manpager 
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# brew
if test (uname) = 'Darwin'
    set -x PATH /opt/homebrew/bin $PATH
    set -x HOMEBREW_NO_ENV_HINTS 1
end

# nvim
if test (uname) = 'Linux'
  set -x PATH /opt/nvim-linux64/bin $PATH
end

# pyenv
set -x PYENV_VERSION "3.10.4"
if test (uname) = 'Linux'
  set -x PATH $HOME/.pyenv/bin $PATH
end


# ===== Aliases ================================================================
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias tree "tree -l -C -a -I '.git' -I 'venv' -I '__pycache__' -I '*.egg-info' -I '*.ipynb_checkpoints' -I 'node_modules'"

alias g git
alias gs "git status"
alias ga "git add"
alias gd "git diff"
alias gds "git diff --staged"
alias gc "git commit"
alias gcm "git commit -m"
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
# alias expo "npx expo"

switch (uname)
  case Darwin
    alias speedtest "networkQuality -v"
  case Linux
    alias speedtest "speedtest-cli"
end


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
  else if test -d
  end
end

# function __update_tmux_window_name --on-variable PWD
#   # Do nothing if tmux is not active
#   if not set -q TMUX;
#     return
#   end
#
#   set window_name (tmux display-message -p '#W')
#   set new_window_name \
#     (fish -c 'git rev-parse --show-toplevel | sed "s/.*\///"' 2>/dev/null)
#   
#   # Do nothing if not in a git directory 
#   if not string length -q $new_window_name;
#     return
#   end
#   
#   # Do nothing if window name is already updated
#   if test $window_name = $new_window_name
#     return
#   end
#
#   tmux rename-window $new_window_name
# end

# ===== Tool setup ============================================================
# fnm
if type fnm -q && status is-interactive 
  fnm env --shell fish --use-on-cd | source
end

# pyenv
pyenv init - | source

# direnv
direnv hook fish | source

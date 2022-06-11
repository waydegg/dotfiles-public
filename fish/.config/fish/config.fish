# ===== Environment Variables =================================================
# Disable Fish greeting
set fish_greeting ""

# Add Homebrew to PATH
set -gx PATH /opt/homebrew/bin $PATH

# Set default editor to Neovim
set -gx EDITOR nvim

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
set -gx IPYTHONDIR ~/.config/ipython

# Specify Docker host to Multipass VM
set -gx DOCKER_HOST 192.168.64.3

# Lazygit config directory
set -gx CONFIG_DIR ~/.config/lazygit

# ===== Aliases ================================================================
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias tree "tree -l -C -a -I '.git' -I 'venv' -I '__pycache__' -I '*.egg-info' -I '*.ipynb_checkpoints'"

alias g git
alias gs "git status"
alias ga "git add"
alias gd "git diff --name-only --diff-filter=d | xargs bat --diff"
alias gc "git commit -m"
alias gw "git worktree"

alias t tmux
alias ts "tmux ls"
alias ta "tmux attach -t"
alias tk "tmux kill-session -t"

alias cat bat
alias d docker
alias dc docker-compose
alias nvm fnm
alias vim nvim
alias vi nvim
alias c clear
alias mp multipass

# ===== Keybinds ==============================================================
# Search through command history
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

# Exit insert mode 
bind -M insert -m default jk force-repaint

# ===== Tool setup ============================================================
# FNM
if type fnm -q && status is-interactive 
  fnm env --shell fish --use-on-cd | source
end

# Venv
source $HOME/.config/fish/functions/__check_venv.fish

# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

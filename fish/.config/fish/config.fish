# Disable Fish greeting
set fish_greeting ""

# Add Homebrew to PATH
set -gx PATH /opt/homebrew/bin $PATH

# Set default editor to Neovim
set -gx EDITOR nvim

# Theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias tree "tree -l -C -a"

alias g git
alias gs "git status"
alias ga "git add"
alias gd "git diff"
alias gc "git commit -m"

alias t tmux
alias ts "tmux ls"
alias ta "tmux attach -t"
alias tk "tmux kill-session -t"

alias cat bat
alias d docker

alias vim nvim

# Keybinds
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source



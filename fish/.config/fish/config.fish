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

# ===== Aliases ================================================================
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
alias nvm fnm

# ===== Keybinds ==============================================================
# Search through command history
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

# Exit insert mode 
bind -M insert -m default jk force-repaint

# ===== Status ================================================================
# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# ===== Prompt ================================================================
# Change cursor shape depending on mode
function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo -en "\e[2 q"
    case insert
      echo -en "\e[6 q"
    case replace_one
      echo -en "\e[4 q"
    case visual
      echo -en "\e[2 q"
    case '*'
      echo -en "\e[2 q"
  end
  set_color normal
end




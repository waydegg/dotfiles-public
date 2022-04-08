# ===== Powerlevel10k ========================================================

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===== General ===============================================================

# Disable bell sound
unsetopt BEEP

# Initialize completions (NOTE: Docker completions not working)
fpath=(~/.zfunc $fpath)
autoload -Uz compinit && compinit -i

# Setup history file
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

# ===== Environment Variables =================================================

export PATH="/opt/homebrew/bin:$PATH"
export ZSH_PLUGIN_PATH=$HOME/.local/share/zsh/plugins

# ===== Functions =============================================================

function zsh_source_plugin() {
    [ -f "$ZSH_PLUGIN_PATH/$1" ] && source "$ZSH_PLUGIN_PATH/$1"
}

function zsh_add_plugin() {
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
  if [ -d "$ZSH_PLUGIN_PATH/$PLUGIN_NAME" ]; then 
    zsh_source_plugin "$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
    zsh_source_plugin "$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    git clone "https://github.com/$1.git" "$ZSH_PLUGIN_PATH/$PLUGIN_NAME" 
  fi
}

function ide() {
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
  tmux select-pane -U 
  nvim
}

function zvm_config() {
  ZVM_ESCAPE_KEYTIMEOUT=0.01
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# ===== Plugins ===============================================================

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "jeffreytse/zsh-vi-mode"
zsh_add_plugin "zsh-users/zsh-completions"

# ===== Keybinds ==============================================================

# Search history
bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

# Search history in Vi mode
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

# "Backward Tab"
bindkey '^[[Z' reverse-menu-complete

# ===== Aliases ===============================================================

alias ls="ls -p -G"
alias la="ls -A"
alias ll="exa -l -g --icons"
alias ll="exa -l -g --icons"
alias lla="ll -a"
alias tree="tree -l -C -a"

alias g=git
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit -m"

alias t=tmux
alias ts="tmux ls"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"

alias python=python3
alias pip="python -m pip"

alias cat=bat
alias d=docker
alias vim=nvim
alias nvm=fnm

# ===== Setup =================================================================

# Setup FNM
eval "$(fnm env --use-on-cd)"

# Setup Zoxide
eval "$(zoxide init zsh)"

# Powerlevel10k
if [ ! -d "$ZSH_PLUGIN_PATH/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $ZSH_PLUGIN_PATH/powerlevel10k
fi
source $ZSH_PLUGIN_PATH/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/ghq/github.com/waydegg/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/ghq/github.com/waydegg/dotfiles/zsh/.p10k.zsh ]] || source ~/ghq/github.com/waydegg/dotfiles/zsh/.p10k.zsh

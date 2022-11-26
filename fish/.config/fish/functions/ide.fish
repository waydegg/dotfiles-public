function ide -d "IDE-like window splits"
  if not set -q TMUX
    echo "No tmux session attached"
    return 1
  end

  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
  tmux select-pane -U
  nvim
end

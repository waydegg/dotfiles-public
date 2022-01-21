function ide
  if set -q $TMUX
    set tmux_session_id (tmux new-session -d -P nvim)
    tmux split-window -t $tmux_session_id -v -p 30
    tmux split-window -t $tmux_session_id -h -p 66
    tmux split-window -t $tmux_session_id -h -p 50
    tmux select-pane -U -t $tmux_session_id
    tmux attach -t $tmux_session_id
  else
    tmux split-window -v -p 30
    tmux split-window -h -p 66
    tmux split-window -h -p 50
    tmux select-pane -U 
    nvim
  end
end



function ta -a session_name -d "Attach or switch to a Tmux session"
  if set -q TMUX
    tmux switch -t $session_name
  else
    tmux attach -t $session_name
  end
end

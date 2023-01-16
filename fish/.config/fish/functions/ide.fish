function ide --description "IDE-like window splits" --argument n_panes
  if not set -q TMUX
    echo "No tmux session attached"
    return 1
  end
  
  if test -z $n_panes
    set n_panes 3
  else if not string match --quiet --regex --invert '\D' $n_panes
    echo "Number of panes must be an integer"
    return 1
  else if test $n_panes -le 1 
    echo "Number of panes must be greater than 1"
    return 1
  end
  
  tmux split-window -v -p 30

  for i in (seq $n_panes 2)
    set split_p (math floor 100 - 100 / $i)
    tmux split-window -h -p $split_p
  end

  tmux select-pane -U
  nvim
end

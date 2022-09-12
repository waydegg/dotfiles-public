set tmux_trans "#[fg=default]#[bg=default]"

set ssh_ip (ip route | sed -n '2p' | rev | cut -d ' ' -f 2 | rev)
set session_name 

if set -q SSH_CLIENT
  tmux set -g status-left " #[bg=lightyellow]SSH: $USER@$remote_ip $tmux_trans #[bg=default][#{session_name}]$tmux_trans "  
else
  tmux set -g status-left " #[bg=default][#{session_name}]$tmux_trans " 
end



#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/nested.sh
. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="ayr"

tmux new-session -d -s $S
tmux_email_pm $S

tmux rename-window -t $S:1 azure-vpn
tmux send-keys -t $S:1 "sudo openvpn ~/drive/mllabs/clients/pm/projects/ayr/security/omar-azure.ovpn" Enter

# tmux new-window -t $S -a -n azure-vm
# tmux send-keys -t $S:2 "az ssh vm --ip 10.0.0.4" Enter
# tmux_nested $S 2

tmux new-window -t $S -a -n aws-vm
tmux send-keys -t $S:2 "cd ~/code/pm/ayr/" Enter
# tmux send-keys -t $S:2 "ssh ubuntu@18.217.167.102" Enter
tmux_nested $S 2

tmux new-window -t $S -a -n db
tmux send-keys -t $S:3 "cd ~/code/pm/ayr/" Enter
tmux send-keys -t $S:3 "psql -h 10.0.0.5 -d ayr-surfside -U omarpocketmade@ayrdwpoc" Enter

tmux new-window -t $S -a -n local-1
tmux send-keys -t $S:4 "cd ~/code/pm/ayr/ayr-website-connectors/" Enter
tmux_env_python $S 4

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:5 "cd ~/code/pm/ayr/ayr-website-connectors/" Enter
tmux_env_python $S 5

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:6 "cd ~/code/pm/ayr/" Enter
tmux_env_python $S 6
tmux_emacs $S 6

tmux select-window -t $S:6
tmux attach -t $S

#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/nested.sh
. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="ayr"

tmux new-session -d -s $S
tmux_email_pm $S

tmux rename-window -t $S:1 azure-vpn
tmux send-keys -t $S:1 "sudo openvpn ~/drive/mllabs/clients/pm/projects/ayr/security/omar-azure.ovpn" Enter

tmux new-window -t $S -a -n azure-vm
tmux send-keys -t $S:2 "az ssh vm --ip 10.0.0.4" Enter
tmux_nested $S 2

# This VM has been deleted
# tmux new-window -t $S -a -n aws-vm
# tmux send-keys -t $S:3 "cd ~/code/pm/ayr/" Enter
# tmux send-keys -t $S:3 "ssh -i ./aws/recommendation-engine.pem ubuntu@3.143.251.76" Enter
# tmux_nested $S 3

tmux new-window -t $S -a -n db
tmux send-keys -t $S:3 "cd ~/code/pm/ayr/" Enter
tmux send-keys -t $S:3 "psql -h 10.0.0.5 -d ayr-surfside -U omarpocketmade@ayrdwpoc" Enter

tmux new-window -t $S -a -n local-0
tmux send-keys -t $S:4 "cd ~/code/pm/ayr/prev/" Enter
tmux_env_python $S 4

tmux new-window -t $S -a -n local-1
tmux send-keys -t $S:5 "cd ~/code/pm/ayr/ayr-website-connectors/" Enter
tmux_env_python $S 5

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:6 "cd ~/code/pm/ayr/ayr-website-connectors/" Enter
tmux_env_python $S 6

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/pm/ayr/" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

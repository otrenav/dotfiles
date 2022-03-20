#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/nested.sh
. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="ayr"

tmux new-session -d -s $S
tmux_email_pm $S

tmux rename-window -t $S:1 vpn
tmux send-keys -t $S:1 "sudo openvpn ~/drive/mllabs/projects/pm/ayr/security/omar-azure.ovpn" Enter

tmux new-window -t $S -a -n vm
tmux send-keys -t $S:2 "az ssh vm --ip 10.0.0.4" Enter
tmux_nested $S 2

tmux new-window -t $S -a -n local
tmux send-keys -t $S:3 "cd ~/code/pm/ayr/" Enter
tmux_env_python $S 3

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:4 "cd ~/code/pm/ayr/" Enter
tmux_env_python $S 4
tmux_emacs $S 4

tmux select-window -t $S:4
tmux attach -t $S

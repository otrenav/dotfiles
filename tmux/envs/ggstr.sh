#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/nested.sh
. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="ggstr"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 aws-ssh-tunnel
tmux send-keys -t $S:1 "cd ~/code/ggstr/ggstr/platform" Enter
tmux send-keys -t $S:1 "
  ssh -i 'auth/omar-trejo.pem' ubuntu@ec2-44-210-134-74.compute-1.amazonaws.com \
      -L 5433:gigster-data-system.cupup2fqtumo.us-east-1.rds.amazonaws.com:5432 \
      -N -p 22
" Enter

tmux new-window -t $S -a -n aws-vm
tmux send-keys -t $S:2 "cd ~/code/ggstr/ggstr/platform" Enter
tmux send-keys -t $S:2 "
  ssh -i 'auth/omar-trejo.pem' ubuntu@ec2-44-210-134-74.compute-1.amazonaws.com
" Enter
tmux_nested $S 2

tmux new-window -t $S -a -n aws-db
tmux send-keys -t $S:3 "cd ~/code/ggstr/ggstr/platform" Enter
tmux send-keys -t $S:3 "
  psql --host=localhost --port=5433 --user=omar-trejo \
       --dbname=gigster-data-system --password
" Enter

tmux new-window -t $S -a -n local-db
tmux send-keys -t $S:4 "cd ~/code/ggstr/ggstr/platform" Enter
tmux send-keys -t $2:4 "psql -d gigster-data-system" Enter
tmux_env_python $S 2

tmux new-window -t $S -a -n local-1
tmux send-keys -t $S:5 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 5

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:6 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 6

tmux new-window -t $S -a -n local-3
tmux send-keys -t $S:7 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 7

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:8 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_emacs $S 8

tmux select-window -t $S:8
tmux attach -t $S

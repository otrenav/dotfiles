#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/nested.sh
. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="ggstr"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 aws-vm
tmux send-keys -t $S:1 "cd ~/code/ggstr/ggstr/" Enter
tmux send-keys -t $S:1 "
  ssh -i 'gigster-data-system/dev/auth/omar-trejo.pem' ubuntu@ec2-44-210-134-74.compute-1.amazonaws.com
" Enter
tmux_nested $S 1

tmux new-window -t $S -a -n aws-vm-ssh-tunnel-db-gns
tmux send-keys -t $S:2 "cd ~/code/ggstr/ggstr/" Enter

tmux new-window -t $S -a -n aws-vm-ssh-tunnel-db-gds
tmux send-keys -t $S:3 "cd ~/code/ggstr/ggstr/" Enter

tmux new-window -t $S -a -n aws-db-gns
tmux send-keys -t $S:4 "cd ~/code/ggstr/ggstr/" Enter

tmux new-window -t $S -a -n aws-db-gds
tmux send-keys -t $S:5 "cd ~/code/ggstr/ggstr/" Enter

tmux new-window -t $S -a -n lcl-db-gns
tmux send-keys -t $S:6 "cd ~/code/ggstr/ggstr/" Enter
tmux send-keys -t $2:6 "psql -d gigster-network-system" Enter

tmux new-window -t $S -a -n lcl-db-gds
tmux send-keys -t $S:7 "cd ~/code/ggstr/ggstr/" Enter
tmux send-keys -t $2:7 "psql -d gigster-data-system" Enter

tmux new-window -t $S -a -n lcl-1
tmux send-keys -t $S:8 "cd ~/code/ggstr/ggstr/" Enter
tmux_env_python $S 8 "gigster-data-system"

tmux new-window -t $S -a -n lcl-2
tmux send-keys -t $S:9 "cd ~/code/ggstr/ggstr/" Enter
tmux_env_python $S 9 "gigster-data-system"

tmux new-window -t $S -a -n lcl-3
tmux send-keys -t $S:10 "cd ~/code/ggstr/ggstr/" Enter
tmux_env_python $S 10 "gigster-data-system"

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:11 "cd ~/code/ggstr/ggstr/" Enter
tmux_emacs $S 11

tmux select-window -t $S:11
tmux attach -t $S

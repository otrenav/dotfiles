#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/nested.sh
. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="ggstr"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 vm
tmux send-keys -t $S:1 "cd ~/code/ggstr/ggstr/platform" Enter
tmux send-keys -t $S:1 "
  ssh -i 'auth/omar-trejo.pem' ubuntu@ec2-44-213-58-235.compute-1.amazonaws.com
" Enter
tmux_nested $S 1

tmux new-window -t $S -a -n local-db
tmux send-keys -t $S:2 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 2

tmux new-window -t $S -a -n local-1
tmux send-keys -t $S:3 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 3

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:4 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_env_python $S 4

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:5 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_emacs $S 5

tmux select-window -t $S:5
tmux attach -t $S

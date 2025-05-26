#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="alpha"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 db
tmux send-keys -t $S:1 "cd ~/code/ggstr/alpha/be/svc-sim" Enter
tmux_env_python $S 1

tmux new-window -t $S -a -n sim-1
tmux send-keys -t $S:2 "cd ~/code/ggstr/alpha/be/svc-sim" Enter
tmux_env_python $S 2

tmux new-window -t $S -a -n sim-2
tmux send-keys -t $S:3 "cd ~/code/ggstr/alpha/be/svc-sim" Enter
tmux_env_python $S 3

tmux new-window -t $S -a -n data-1
tmux send-keys -t $S:4 "cd ~/code/ggstr/alpha/be/svc-data" Enter
tmux_env_python $S 4
tmux send-keys -t $S:4 "python main.py" Enter

tmux new-window -t $S -a -n data-2
tmux send-keys -t $S:5 "cd ~/code/ggstr/alpha/be/svc-data" Enter
tmux_env_python $S 5

tmux new-window -t $S -a -n app-1
tmux send-keys -t $S:6 "cd ~/code/ggstr/alpha/be/svc-app" Enter
tmux_env_python $S 6
tmux send-keys -t $S:6 "python main.py" Enter

tmux new-window -t $S -a -n app-2
tmux send-keys -t $S:7 "cd ~/code/ggstr/alpha/be/svc-app" Enter
tmux_env_python $S 7

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:8 "cd ~/code/ggstr/alpha/be" Enter
tmux_env_python $S 8
tmux_emacs $S 8

tmux select-window -t $S:8
tmux attach -t $S

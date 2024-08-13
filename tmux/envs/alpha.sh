#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="alpha"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 simulator
tmux send-keys -t $S:1 "cd ~/code/ggstr/alpha/svc-simulator" Enter
tmux_env_python $S 1

tmux new-window -t $S -a -n analyzer
tmux send-keys -t $S:2 "cd ~/code/ggstr/alpha/svc-analyzer" Enter
tmux_env_python $S 2

tmux new-window -t $S -a -n lcl-1
tmux send-keys -t $S:3 "cd ~/code/ggstr/alpha/" Enter
tmux_env_python $S 3

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:4 "cd ~/code/ggstr/alpha/" Enter
tmux_env_python $S 4
tmux_emacs $S 4

tmux select-window -t $S:4
tmux attach -t $S

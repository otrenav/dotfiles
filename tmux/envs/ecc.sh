#!/bin/bash

gcloud config set account omar@pocketmade.com
gcloud config set project pm-ecc-demo

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="ecc"

tmux new-session -d -s $S
tmux_email_pm $S

tmux rename-window -t $S:1 devops
tmux send-keys -t $S:1 "cd ~/code/pm/ecc/" Enter
tmux_env_python $S 1

tmux new-window -t $S -a -n local
tmux send-keys -t $S:2 "cd ~/code/pm/ecc/" Enter
tmux_env_python $S 2

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/pm/ecc/" Enter
tmux_env_python $S 3
tmux_emacs $S 3

tmux select-window -t $S:3
tmux attach -t $S

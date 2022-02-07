#!/bin/bash

gcloud config set account omar@pocketmade.com
gcloud config set project pm-ftb

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="ic"

tmux new-session -d -s $S
tmux_email_pm $S

tmux rename-window -t $S:1 local
tmux send-keys -t $S:1 "cd ~/code/pm/ic/" Enter
tmux_env_python $S 1

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:2 "cd ~/code/pm/ic/" Enter
tmux_env_python $S 2
tmux_emacs $S 2

tmux select-window -t $S:2
tmux attach -t $S

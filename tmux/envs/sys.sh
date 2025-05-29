#!/bin/bash

gcloud config set account omar@mllabs.com
gcloud config set project mllabs-com

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh

export S="sys"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 monitor
tmux send-keys -t $S:1 "cd ~/code/sys/" Enter
tmux send-keys -t $S:1 "btop" Enter
sleep 2
tmux send-keys -t $S:1 "5" Enter

tmux new-window -t $S -a -n lcl-1
tmux send-keys -t $S:2 "cd ~/code/sys/" Enter
tmux_emacs $S 2

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/sys/" Enter
tmux_emacs $S 3

tmux select-window -t $S:
tmux attach -t $S

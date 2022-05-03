#!/bin/bash

gcloud config set account omar@mllabs.com
gcloud config set project mllabs-com

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh

export S="mll"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 devops
tmux send-keys -t $S:1 "cd ~/code/mll/website/" Enter

tmux new-window -t $S -a -n local
tmux send-keys -t $S:2 "cd ~/code/mll/website/" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/mll/website/" Enter
tmux_emacs $S 3

tmux select-window -t $S:3
tmux attach -t $S

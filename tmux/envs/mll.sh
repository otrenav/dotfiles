#!/bin/bash

gcloud config set account omar@mllabs.com
gcloud config set project mllabs-com

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh

export S="mll"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 lcl-1
tmux send-keys -t $S:1 "cd ~/code/mll/mll" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:2 "cd ~/code/mll/mll" Enter
tmux_emacs $S 2

tmux new-window -t $S -a -n claude
tmux send-keys -t $S:3 "cd ~/code/mll/mll" Enter
tmux send-keys -t $S:3 "claude --dangerously-skip-permissions" Enter

tmux new-window -t $S -a -n gemini
tmux send-keys -t $S:3 "cd ~/code/mll/mll" Enter
tmux send-keys -t $S:3 "gemini" Enter

tmux select-window -t $S:2
tmux attach -t $S

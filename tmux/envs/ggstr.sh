#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh

export S="ggstr"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 local-1
tmux send-keys -t $S:1 "cd ~/code/ggstr/ggstr/platform" Enter

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:2 "cd ~/code/ggstr/ggstr/platform" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/ggstr/ggstr/platform" Enter
tmux_emacs $S 3

tmux select-window -t $S:3
tmux attach -t $S

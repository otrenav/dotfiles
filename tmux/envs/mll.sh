#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh

export S="mll"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 local
tmux send-keys -t $S:1 "cd ~/code/system/dotfiles/" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:2 "cd ~/code/system/dotfiles/" Enter
tmux_emacs $S 2

tmux select-window -t $S:2
tmux attach -t $S
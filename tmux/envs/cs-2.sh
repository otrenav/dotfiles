#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="cb"

tmux new-session -d -s $S
tmux_email_cb $S

tmux rename-window -t $S:1 btop
tmux send-keys -t $S:1 "cd ~/code/mll/cb/poc-2" Enter
tmux send-keys -t $S:1 ". ./venv/bin/activate" Enter
tmux send-keys -t $S:1 "btop" Enter
sleep 2
tmux send-keys -t $S:1 "5" Enter

tmux new-window -t $S -a -n lcl-1
tmux send-keys -t $S:2 "cd ~/code/mll/cb/poc-2" Enter
tmux send-keys -t $S:2 ". ./venv/bin/activate" Enter
tmux send-keys -t $S:2 "C-l" Enter

tmux new-window -t $S:3 -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/mll/cb/poc-2" Enter
tmux send-keys -t $S:3 ". ./venv/bin/activate" Enter
tmux_emacs $S 3

tmux new-window -t $S -a -n ai
tmux send-keys -t $S:4 "cd ~/code/mll/cb/poc-2" Enter
tmux send-keys -t $S:4 "claude" Enter

tmux select-window -t $S:3
tmux attach -t $S

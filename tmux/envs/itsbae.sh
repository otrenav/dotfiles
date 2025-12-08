#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh

export S="itsbae"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 bt-fe
tmux send-keys -t $S:1 "cd ~/code/mll/mll/itsbae/fe/" Enter
tmux send-keys -t $S:1 "C-l" Enter
tmux send-keys -t $S:1 "git pull" Enter
tmux send-keys -t $S:1 ". ./start.sh" Enter

tmux new-window -t $S:2 -a -n bt-be
tmux send-keys -t $S:2 "cd ~/code/mll/mll/itsbae/be/" Enter
tmux send-keys -t $S:2 "C-l" Enter
tmux send-keys -t $S:2 ". ./start.sh" Enter

tmux new-window -t $S:3 -a -n emacs
tmux send-keys -t $S:3 "cd ~/code/mll/mll/itsbae/be/" Enter
tmux send-keys -t $S:3 ". ./be/venv/bin/activate" Enter
tmux_emacs $S 3

tmux new-window -t $S:4 -a -n ai
tmux send-keys -t $S:4 "cd ~/code/mll/mll/itsbae/" Enter
tmux send-keys -t $S:4 ". ./be/venv/bin/activate" Enter

tmux select-window -t $S:3
tmux attach -t $S

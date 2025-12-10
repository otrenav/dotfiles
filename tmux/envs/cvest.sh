#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh

export S="cvest"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 bt-fe
tmux send-keys -t $S:1 "cd ~/code/mll/mll/cvest/bt/fe/" Enter
tmux send-keys -t $S:1 "C-l" Enter
tmux send-keys -t $S:1 "git pull" Enter
tmux send-keys -t $S:1 ". ./start.sh" Enter

tmux new-window -t $S:2 -a -n bt-be
tmux send-keys -t $S:2 "cd ~/code/mll/mll/cvest/bt/be/" Enter
tmux send-keys -t $S:2 "C-l" Enter
tmux send-keys -t $S:2 ". ./start.sh" Enter

tmux new-window -t $S:3 -a -n sim-fe
tmux send-keys -t $S:3 "cd ~/code/mll/mll/cvest/sim/fe/" Enter
tmux send-keys -t $S:3 "C-l" Enter
tmux send-keys -t $S:3 ". ./start.sh" Enter

tmux new-window -t $S:4 -a -n sim-be
tmux send-keys -t $S:4 "cd ~/code/mll/mll/cvest/sim/be/" Enter
tmux send-keys -t $S:4 "C-l" Enter
tmux send-keys -t $S:4 ". ./start.sh" Enter

tmux new-window -t $S:5 -a -n data-fe
tmux send-keys -t $S:5 "cd ~/code/mll/mll/cvest/data/fe/" Enter
tmux send-keys -t $S:5 "C-l" Enter
tmux send-keys -t $S:5 ". ./start.sh" Enter

tmux new-window -t $S:6 -a -n data-be
tmux send-keys -t $S:6 "cd ~/code/mll/mll/cvest/data/be/" Enter
tmux send-keys -t $S:6 "C-l" Enter
tmux send-keys -t $S:6 ". ./start.sh" Enter

tmux new-window -t $S:7 -a -n app-fe
tmux send-keys -t $S:7 "cd ~/code/mll/mll/cvest/app/fe/" Enter
tmux send-keys -t $S:7 "C-l" Enter
tmux send-keys -t $S:7 ". ./start.sh" Enter

tmux new-window -t $S:8 -a -n app-be
tmux send-keys -t $S:8 "cd ~/code/mll/mll/cvest/app/be/" Enter
tmux send-keys -t $S:8 "C-l" Enter
tmux send-keys -t $S:8 ". ./start.sh" Enter

tmux new-window -t $S:9 -a -n emacs
tmux send-keys -t $S:9 "cd ~/code/mll/mll/cvest/app/be/" Enter
tmux send-keys -t $S:9 ". ./app/venv/bin/activate" Enter
tmux_emacs $S 9

tmux new-window -t $S:10 -a -n ai-1
tmux send-keys -t $S:10 "cd ~/code/mll/mll/cvest/" Enter
tmux send-keys -t $S:10 ". ./app/venv/bin/activate" Enter

tmux new-window -t $S:11 -a -n ai-2
tmux send-keys -t $S:11 "cd ~/code/mll/mll/cvest/" Enter
tmux send-keys -t $S:11 ". ./app/venv/bin/activate" Enter

tmux select-window -t $S:9
tmux attach -t $S

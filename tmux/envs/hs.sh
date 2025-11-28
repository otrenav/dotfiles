#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh

export S="hs"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 sim-fe
tmux send-keys -t $S:1 "cd ~/code/mll/hs/platform/ehr/fe/" Enter
tmux send-keys -t $S:1 "C-l" Enter
tmux send-keys -t $S:1 "git pull" Enter
tmux send-keys -t $S:1 ". ./start.sh" Enter

tmux new-window -t $S:2 -a -n sim-be
tmux send-keys -t $S:2 "cd ~/code/mll/hs/platform/ehr/be/" Enter
tmux send-keys -t $S:2 "C-l" Enter
tmux send-keys -t $S:2 ". ./start.sh" Enter

tmux new-window -t $S:3 -a -n mip-fe
tmux send-keys -t $S:3 "cd ~/code/mll/hs/platform/fe/" Enter
tmux send-keys -t $S:3 "C-l" Enter
tmux send-keys -t $S:3 "npm run dev:lcl" Enter

tmux new-window -t $S:4 -a -n mip-mod
tmux send-keys -t $S:4 "cd ~/code/mll/hs/models/insights-models-mt-sinai-lvef-low/" Enter
tmux send-keys -t $S:4 ". ./venv/bin/activate" Enter
tmux send-keys -t $S:4 "C-l" Enter
tmux send-keys -t $S:4 "python main.py" Enter

tmux new-window -t $S:5 -a -n mip-plt-1
tmux send-keys -t $S:5 "cd ~/code/mll/hs/platform/be/" Enter
tmux send-keys -t $S:5 ". ./venv/bin/activate" Enter
tmux send-keys -t $S:5 "C-l" Enter
tmux send-keys -t $S:5 "python main.py" Enter

tmux new-window -t $S:6 -a -n mip-plt-2
tmux send-keys -t $S:6 "cd ~/code/mll/hs/platform/be/" Enter
tmux send-keys -t $S:6 ". ./venv/bin/activate" Enter
tmux send-keys -t $S:6 "C-l" Enter

tmux new-window -t $S:7 -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/mll/hs/platform/be/" Enter
tmux send-keys -t $S:7 ". ./venv/bin/activate" Enter
tmux_emacs $S 7

tmux new-window -t $S:8 -a -n claude
tmux send-keys -t $S:8 "cd ~/code/mll/hs/platform/" Enter
tmux send-keys -t $S:8 ". ./be/venv/bin/activate" Enter
# tmux send-keys -t $S:8 "claude --dangerously-skip-permissions" Enter

tmux select-window -t $S:7
tmux attach -t $S

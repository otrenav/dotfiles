#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="hs"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 fe
tmux send-keys -t $S:1 "cd ~/code/mll/hs/platform/fe/" Enter
tmux send-keys -t $S:1 "C-l" Enter
tmux send-keys -t $S:1 "git pull" Enter
tmux send-keys -t $S:1 "npm run dev:lcl" Enter

tmux new-window -t $S:2 -a -n fe-tests
tmux send-keys -t $S:2 "cd ~/code/mll/hs/platform/qa/" Enter
tmux send-keys -t $S:2 "C-l" Enter
tmux send-keys -t $S:2 "npm test dev" Enter

tmux new-window -t $S:3 -a -n mod-2
tmux send-keys -t $S:3 "cd ~/code/mll/hs/models/insights-models-mt-sinai-lvef-low-densenet121-v1/" Enter
tmux_env_python $S 3
tmux send-keys -t $S:3 "C-l" Enter

tmux new-window -t $S:4 -a -n mod-1
tmux send-keys -t $S:4 "cd ~/code/mll/hs/models/insights-models-mt-sinai-lvef-low-densenet121-v1/" Enter
tmux_env_python $S 4
tmux send-keys -t $S:4 "C-l" Enter
tmux send-keys -t $S:4 "python main.py" Enter

tmux new-window -t $S:5 -a -n plt-1
tmux send-keys -t $S:5 "cd ~/code/mll/hs/platform/be/" Enter
tmux_env_python $S 5
tmux send-keys -t $S:5 "C-l" Enter
tmux send-keys -t $S:5 "python main.py" Enter

tmux new-window -t $S:6 -a -n plt-2
tmux send-keys -t $S:6 "cd ~/code/mll/hs/platform/be/" Enter
tmux_env_python $S 6
tmux send-keys -t $S:6 "C-l" Enter

tmux new-window -t $S:7 -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/mll/hs/platform/be/" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

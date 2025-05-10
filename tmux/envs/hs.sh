#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="hs"

tmux new-session -d -s $S
tmux_email_mll $S

tmux rename-window -t $S:1 fe
tmux send-keys -t $S:1 "cd ~/code/mll/hs/insights-platform/fe/" Enter
tmux_env_python $S 1

tmux new-window -t $S:2 -a -n plg-1
tmux send-keys -t $S:2 "cd ~/code/mll/hs/insights-plugins-mt-sinai-lvef-densenet121-v1/" Enter
tmux_env_python $S 2

tmux new-window -t $S:3 -a -n plg-2
tmux send-keys -t $S:3 "cd ~/code/mll/hs/insights-plugins-mt-sinai-lvef-densenet121-v2/" Enter
tmux_env_python $S 3

tmux new-window -t $S:4 -a -n plg-2
tmux send-keys -t $S:4 "cd ~/code/mll/hs/insights-plugins-mt-sinai-lvef-wide-resnet101_2-v2/" Enter
tmux_env_python $S 4

tmux new-window -t $S:5 -a -n plt-1
tmux send-keys -t $S:5 "cd ~/code/mll/hs/insights-platform/be/" Enter
tmux_env_python $S 5

tmux new-window -t $S:6 -a -n plt-2
tmux send-keys -t $S:6 "cd ~/code/mll/hs/insights-platform/be/" Enter
tmux_env_python $S 6

tmux new-window -t $S:7 -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/mll/hs/" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

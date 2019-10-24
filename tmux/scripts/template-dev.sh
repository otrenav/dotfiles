#!/bin/bash

SESSION=`basename $PWD`

tmux new-session -d -s $SESSION
tmux rename-window -t $SESSION:1 vim
tmux send-ekys -t vim 'vim' Enter
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 30
tmux new-window -t $SESSION -a -n git
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane R 30
tmux new-window -t $SESSION -a -n misc
tmux split-window -h
tmux select-pane -t 0
tmux select-window -t $SESSION:1
tmux attach -t $SESSION

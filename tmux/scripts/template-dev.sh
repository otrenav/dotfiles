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

#
# TODO: use a variable for development
#
# tmux has-session -t development
# if [ $? != 0 ]; then
#     tmux new-session -s development -n editor -d
#     cd ~/development
#     tmux send-keys -t development "cd ~/development" C-m
#     tmux send-keys -t development "vim" C-m
#     tmux split-window -v -t development
#     tmux split-window -v -p 10 -t development
#     tmux select-layout -t development main-horizontal
#     tmux send-keys -t development:1.2 "cd ~/development" C-m
#     tmux new-window -n console -t development
#     tmux send-keys -t development:2 "cd ~/development" C-m
#     tmux select-window -t development:1
#     tmux attach -t development
# fi
# tmux attach -t development

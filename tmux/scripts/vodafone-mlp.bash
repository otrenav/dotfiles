#!/bin/bash

SESSION="vodafone-mlp"

tmux new-session -d -s $SESSION

tmux rename-window -t $SESSION:1 vim
tmux send-keys -t vim "vim" Enter
tmux split-window -h
tmux select-pane -t 1
tmux resize-pane -R 30

tmux new-window -t $SESSION -a -n git
tmux split-window -h
tmux select-pane -t 1
tmux resize-pane -R 30

tmux new-window -t $SESSION -a -n authorizer
tmux new-window -t $SESSION -a -n logger
tmux new-window -t $SESSION -a -n data_service
tmux new-window -t $SESSION -a -n data_catalogue
tmux new-window -t $SESSION -a -n data_transformer
tmux new-window -t $SESSION -a -n model_catalogue
tmux new-window -t $SESSION -a -n model_trainers
tmux new-window -t $SESSION -a -n model_endpoints
tmux new-window -t $SESSION -a -n workflow_catalogue
tmux new-window -t $SESSION -a -n notifier

tmux select-window -t $SESSION:1
tmux attach -t $SESSION

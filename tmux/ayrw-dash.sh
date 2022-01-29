#!/bin/bash

SESSION="ayrw-dash"

tmux new-session -d -s $SESSION

tmux set -t $SESSION status-right "Pocket Made: Omar Trejo (omar@pocketmade.com) "

tmux rename-window -t $SESSION:1 vpn
tmux send-keys -t $SESSION:1 "sudo openvpn ~/drive/mllabs/projects/pm/ayrw/security/omar-azure.ovpn" Enter

tmux new-window -t $SESSION -a -n vm
tmux send-keys -t $SESSION:2 "az ssh vm --ip 10.0.0.4" Enter
tmux send-keys -t $SESSION:2 "tmux attach" Enter
sleep 10 && \
    tmux send-keys -t $SESSION:2 "tmux set status-right vm" Enter && \
    tmux send-keys -t $SESSION:2 "cd dashboards; . ./env/bin/activate; . ./env.sh; cd .." Enter

tmux new-window -t $SESSION -a -n local
tmux send-keys -t $SESSION:3 "cd ~/code/pm/ayrw/dashboards/" Enter
tmux send-keys -t $SESSION:3 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:3 ". ./env.sh" Enter

tmux new-window -t $SESSION -a -n emacs
tmux send-keys -t $SESSION:4 "cd ~/code/pm/ayrw/dashboards/" Enter
tmux send-keys -t $SESSION:4 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:4 ". ./env.sh" Enter
tmux send-keys -t $SESSION:4 "emacs ." Enter
sleep 1 && \
    tmux send-keys -t $SESSION:4 "M-x" && \
    tmux send-keys -t $SESSION:4 "neotree" && \
    sleep 1.0 && \
    tmux send-keys -t $SESSION:4 Enter && \
    sleep 1.0 && \
    tmux send-keys -t $SESSION:4 "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-x" && \
    tmux send-keys -t $SESSION:4 "+" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:4 "C-o"

tmux select-window -t $SESSION:4
tmux attach -t $SESSION

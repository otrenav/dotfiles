#!/bin/bash

SESSION="vf-vrs"

GC_PROJECT="vf-grp-rtm-pprd-sor"
GC_INSTANCE="instance-1"
GC_ZONE="europe-west1-b"

tmux new-session -d -s $SESSION

tmux set -t $SESSION status-right "Gigster: Omar Trejo (omar.trejo@gigsternetwork.com) "

tmux rename-window -t $SESSION:1 proxy-internet
tmux send-keys -t $SESSION:1 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -D localhost:5000" Enter

tmux rename-window -t $SESSION:1 proxy-kibana
tmux send-keys -t $SESSION:2 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -L 5602:localhost:5601" Enter

tmux new-window -t $SESSION -a -n vm
tmux send-keys -t $SESSION:3 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap" Enter
tmux send-keys -t $SESSION:3 "tmux" Enter
sleep 10 && \
    tmux send-keys -t $SESSION:3 "tmux set status-right '$GC_INSTANCE'" Enter && \
    tmux send-keys -t $SESSION:3 "cd mlp; . ./env.sh; cd .." Enter

tmux new-window -t $SESSION -a -n local
tmux send-keys -t $SESSION:4 "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux send-keys -t $SESSION:4 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:4 ". ./env.sh" Enter

tmux new-window -t $SESSION -a -n emacs
tmux send-keys -t $SESSION:5 "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux send-keys -t $SESSION:5 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:5 ". ./env.sh" Enter
tmux send-keys -t $SESSION:5 "emacs ." Enter
sleep 1 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "C-x" && \
    tmux send-keys -t $SESSION:5 "+" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 "M-x" && \
    tmux send-keys -t $SESSION:5 "neotree" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:5 Enter

tmux select-window -t $SESSION:5
tmux attach -t $SESSION

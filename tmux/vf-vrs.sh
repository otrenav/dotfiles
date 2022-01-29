#!/bin/bash

SESSION="vf-vrs"

GC_PROJECT="vf-grp-rtm-pprd-sor"
GC_INSTANCE="instance-1"
GC_ZONE="europe-west1-b"
GC_PORT="5000"

tmux new-session -d -s $SESSION

tmux set -t $SESSION status-right "Gigster: Omar Trejo (omar.trejo@gigsternetwork.com) "

tmux rename-window -t $SESSION:1 proxy
tmux send-keys -t $SESSION:proxy "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -D localhost:$GC_PORT" Enter

tmux new-window -t $SESSION -a -n chrome
tmux send-keys -t $SESSION:chrome "
  google-chrome \
  --proxy-server='socks5://localhost:$GC_PORT' \
  --user-data-dir=/home/otrenav/code/ggstr/vf/chrome-proxied" Enter

tmux new-window -t $SESSION -a -n vm
tmux send-keys -t $SESSION:vm "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap" Enter
tmux send-keys -t $SESSION:vm "tmux" Enter
sleep 10 && \
    tmux send-keys -t $SESSION:vm "tmux set status-right '$GC_INSTANCE'" Enter && \
    tmux send-keys -t $SESSION:vm "cd mlp; . ./env.sh; cd .." Enter

tmux new-window -t $SESSION -a -n local
tmux send-keys -t $SESSION:local "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux send-keys -t $SESSION:local ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:local ". ./env.sh" Enter

tmux new-window -t $SESSION -a -n emacs
tmux send-keys -t $SESSION:emacs "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux send-keys -t $SESSION:emacs ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:emacs ". ./env.sh" Enter
tmux send-keys -t $SESSION:emacs "emacs ." Enter
sleep 1 && \
    tmux send-keys -t $SESSION:emacs "M-x" && \
    tmux send-keys -t $SESSION:emacs "neotree" && \
    sleep 1.0 && \
    tmux send-keys -t $SESSION:emacs Enter && \
    sleep 1.0 && \
    tmux send-keys -t $SESSION:emacs "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "k" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "3" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-x" && \
    tmux send-keys -t $SESSION:emacs "+" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-o" && \
    sleep 0.5 && \
    tmux send-keys -t $SESSION:emacs "C-o"

tmux select-window -t $SESSION:emacs
tmux attach -t $SESSION

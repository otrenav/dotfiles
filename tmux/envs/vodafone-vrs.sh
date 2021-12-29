#!/bin/bash

SESSION="vodafone-vrs"

CHROME_PROXIED="vodafone/chrome-proxied"
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
tmux send-keys -t $SESSION:2 "
  google-chrome \
  --proxy-server='socks5://localhost:$GC_PORT' \
  --user-data-dir=/home/otrenav/projects/$CHROME_PROXIED" Enter

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

tmux new-window -t $SESSION -a -n local-1
tmux send-keys -t $SESSION:4 "cd ~/projects/vodafone/iter-3-vrs-prod/" Enter
tmux send-keys -t $SESSION:4 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:4 ". ./env.sh" Enter

tmux new-window -t $SESSION -a -n local-2
tmux send-keys -t $SESSION:5 "cd ~/projects/vodafone/iter-3-vrs-prod/" Enter
tmux send-keys -t $SESSION:5 ". ./env/bin/activate" Enter
tmux send-keys -t $SESSION:5 ". ./env.sh" Enter

tmux select-window -t $SESSION:3
tmux attach -t $SESSION

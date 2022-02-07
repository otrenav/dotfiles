#!/bin/bash

gcloud config set account omar.trejo@vodafone.com
gcloud config set project vf-grp-rtm-pprd-sor

. ~/code/system/dotfiles/tmux/funcs/nested.sh
. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

SESSION="vf"

GC_PROJECT="vf-grp-rtm-pprd-sor"
GC_INSTANCE="instance-1"
GC_ZONE="europe-west1-b"

tmux new-session -d -s $SESSION
tmux_email_ggstr $S

tmux rename-window -t $SESSION:1 proxy-internet
tmux send-keys -t $SESSION:1 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -D localhost:5000" Enter

tmux new-window -t $SESSION -a -n proxy-kibana
tmux send-keys -t $SESSION:2 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -L 5602:localhost:5601" Enter

tmux new-window -t $SESSION -a -n chrome-proxied
tmux send-keys -t $SESSION:3 "
  google-chrome \
  --proxy-server='socks5://localhost:5000' \
  --user-data-dir=/home/otrenav/code/ggstr/vf/chrome-proxied" Enter

tmux new-window -t $SESSION -a -n vm
tmux send-keys -t $SESSION:4 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap" Enter
tmux_nested $S 4

tmux new-window -t $SESSION -a -n local
tmux send-keys -t $SESSION:5 "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux_env_python $S 5

tmux new-window -t $SESSION -a -n emacs
tmux send-keys -t $SESSION:6 "cd ~/code/ggstr/vf/3-vrs-prod/" Enter
tmux_env_python $S 6
tmux_emacs $S 6

tmux select-window -t $SESSION:6
tmux attach -t $SESSION

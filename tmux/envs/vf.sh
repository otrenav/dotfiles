#!/bin/bash

gcloud config set account omar.trejo@vodafone.com
gcloud config set project vf-grp-rtm-pprd-sor

. ~/code/sys/dotfiles/tmux/funcs/nested.sh
. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="vf"

GC_PROJECT="vf-grp-rtm-pprd-sor"
GC_INSTANCE="instance-1"
GC_ZONE="europe-west1-b"

tmux new-session -d -s $S
tmux_email_ggstr $S

tmux rename-window -t $S:1 proxy-internet
tmux send-keys -t $S:1 "
  gcloud compute ssh $GC_INSTANCE \
  --project=$GC_PROJECT \
  --zone=$GC_ZONE \
  --tunnel-through-iap -- -N -p 22 -D localhost:5000
" Enter

# No longer using the VM as a Kibana proxy
# tmux new-window -t $S -a -n proxy-kibana
# tmux send-keys -t $S:2 "
#   gcloud compute ssh $GC_INSTANCE \
#   --project=$GC_PROJECT \
#   --zone=$GC_ZONE \
#   --tunnel-through-iap -- -N -p 22 -L 5602:localhost:5601" Enter

tmux new-window -t $S -a -n chrome-proxied
tmux send-keys -t $S:2 "
  google-chrome \
  --proxy-server='socks5://localhost:5000' \
  --user-data-dir=/home/otrenav/code/ggstr/vf/chrome-proxied \
  1> /dev/null \
  2> /dev/null" Enter

tmux new-window -t $S -a -n vm-prd
tmux send-keys -t $S:3 "
  gcloud compute ssh $GC_INSTANCE \
  --project=vf-grp-rtm-prd-sor \
  --zone=$GC_ZONE \
  --tunnel-through-iap" Enter
tmux_nested_reuse $S 3

tmux new-window -t $S -a -n vm-pprd
tmux send-keys -t $S:4 "
  gcloud compute ssh $GC_INSTANCE \
  --project=vf-grp-rtm-pprd-sor \
  --zone=$GC_ZONE \
  --tunnel-through-iap" Enter
tmux_nested_reuse $S 4

tmux new-window -t $S -a -n local-1
tmux send-keys -t $S:5 "cd ~/code/ggstr/vf/vrs/" Enter
tmux_env_python $S 5
tmux send-keys -t $S:5 ". ./env-pprd.sh" Enter

tmux new-window -t $S -a -n local-2
tmux send-keys -t $S:6 "cd ~/code/ggstr/vf/vrs/" Enter
tmux_env_python $S 6
tmux send-keys -t $S:6 ". ./env-pprd.sh" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/ggstr/vf/vrs/" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

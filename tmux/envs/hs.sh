#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh
. ~/code/system/dotfiles/tmux/funcs/envs.sh

export S="hs"

tmux new-session -d -s $S
tmux_email_orth $S

tmux rename-window -t $S:1 web
tmux send-keys -t $S:1 "cd ~/code/ggstr/orth/hs/web/" Enter
tmux_env_python $S 1

tmux new-window -t $S:2 -a -n shared
tmux send-keys -t $S:2 "cd ~/code/ggstr/orth/hs/insights-shared-backend/" Enter
tmux_env_python $S 2

tmux new-window -t $S:3 -a -n svc-dvc-1
tmux send-keys -t $S:3 "cd ~/code/ggstr/orth/hs/insights-algo-backend/" Enter
tmux_env_python $S 3

tmux new-window -t $S:4 -a -n svc-dvc-2
tmux send-keys -t $S:4 "cd ~/code/ggstr/orth/hs/insights-algo-backend/" Enter
tmux_env_python $S 4

tmux new-window -t $S:5 -a -n svc-plt-1
tmux send-keys -t $S:5 "cd ~/code/ggstr/orth/hs/insights-platform-backend/" Enter
tmux_env_python $S 5

tmux new-window -t $S:6 -a -n svc-plt-2
tmux send-keys -t $S:6 "cd ~/code/ggstr/orth/hs/insights-platform-backend/" Enter
tmux_env_python $S 6

tmux new-window -t $S:7 -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/ggstr/orth/hs/" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

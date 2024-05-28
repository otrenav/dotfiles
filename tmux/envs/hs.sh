#!/bin/bash

. ~/code/system/dotfiles/tmux/funcs/emails.sh
. ~/code/system/dotfiles/tmux/funcs/emacs.sh

export S="hs"

tmux new-session -d -s $S
tmux_email_orth $S

tmux rename-window -t $S:1 lcl-1
tmux send-keys -t $S:1 "cd ~/code/ggstr/orth/hs/" Enter

tmux new-window -t $S -a -n lcl-2
tmux send-keys -t $S:2 "cd ~/code/ggstr/orth/hs/" Enter

tmux new-window -t $S -a -n lcl-3
tmux send-keys -t $S:3 "cd ~/code/ggstr/orth/hs/" Enter

tmux new-window -t $S -a -n lcl-4
tmux send-keys -t $S:4 "cd ~/code/ggstr/orth/hs/" Enter

tmux new-window -t $S -a -n emacs
tmux send-keys -t $S:5 "cd ~/code/ggstr/orth/hs/" Enter
tmux_emacs $S 5

tmux select-window -t $S:5
tmux attach -t $S

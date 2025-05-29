#!/bin/bash

. ~/code/sys/dotfiles/tmux/funcs/emails.sh
. ~/code/sys/dotfiles/tmux/funcs/emacs.sh
. ~/code/sys/dotfiles/tmux/funcs/envs.sh

export S="cb"

tmux new-session -d -s $S
tmux_email_cb $S

tmux rename-window -t $S:1 btop
tmux send-keys -t $S:1 "cd ~/code/mll/cb/gbc2s" Enter
tmux_env_python $S 1
tmux send-keys -t $S:1 "btop" Enter
sleep 2
tmux send-keys -t $S:1 "5" Enter

tmux new-window -t $S -a -n llm-openai
tmux send-keys -t $S:2 "cd ~/code/mll/cb/gbc2s/llms/openai" Enter
tmux_env_python $S 2
tmux send-keys -t $S:2 "C-l" Enter
tmux send-keys -t $S:2 "python main.py" Enter

tmux new-window -t $S -a -n llm-llama
tmux send-keys -t $S:3 "cd ~/code/mll/cb/gbc2s/llms/llama" Enter
tmux_env_python $S 3
tmux send-keys -t $S:3 "C-l" Enter
tmux send-keys -t $S:3 "python main.py" Enter

tmux new-window -t $S -a -n llm-codet5
tmux send-keys -t $S:4 "cd ~/code/mll/cb/gbc2s/llms/codet5" Enter
tmux_env_python $S 4
tmux send-keys -t $S:4 "C-l" Enter
tmux send-keys -t $S:4 "python main.py" Enter

tmux new-window -t $S -a -n llm-codellama
tmux send-keys -t $S:5 "cd ~/code/mll/cb/gbc2s/llms/codellama" Enter
tmux_env_python $S 5
tmux send-keys -t $S:5 "C-l" Enter
tmux send-keys -t $S:5 "python main.py" Enter

tmux new-window -t $S -a -n lcl-1
tmux send-keys -t $S:7 "cd ~/code/mll/cb/gbc2s" Enter
tmux_env_python $S 6
tmux send-keys -t $S:6 "C-l" Enter

tmux new-window -t $S:7 -a -n emacs
tmux send-keys -t $S:7 "cd ~/code/mll/cb/gbc2s" Enter
tmux_env_python $S 7
tmux_emacs $S 7

tmux select-window -t $S:7
tmux attach -t $S

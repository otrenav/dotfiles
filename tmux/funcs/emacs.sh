
function tmux_emacs() {
    tmux send-keys -t $1:$2 "emacs ." Enter && \
        sleep 3 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "k" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "k" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "k" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "k" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "k" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "M-x" && \
        tmux send-keys -t $1:$2 "neotree" && \
        tmux send-keys -t $1:$2 Enter && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-o" && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "3" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "3" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 "C-x" && \
        tmux send-keys -t $1:$2 "+" && \
        sleep 0.5 && \
        tmux send-keys -t $1:$2 Enter
}

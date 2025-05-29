
function tmux_nested() {
    tmux send-keys -t $1:$2 "tmux" Enter && \
        sleep 5 && \
        tmux send-keys -t $1:$2 "tmux set status-right vm" Enter && \
        tmux send-keys -t $1:$2 "cd main; . ./env.sh" Enter
}

function tmux_nested_reuse() {
    tmux send-keys -t $1:$2 "tmux a" Enter
}


function tmux_env_python() {
    tmux send-keys -t $1:$2 ". $3/env/bin/activate" Enter
    tmux send-keys -t $1:$2 ". $3/env.sh" Enter
}

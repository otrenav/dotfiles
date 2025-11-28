
EMAIL_MLL="ML LABS: Omar Trejo (omar@mllabs.com) "
EMAIL_CS="CoreStory: Omar Trejo (omar.trejo@corestory.ai) "
EMAIL_GGSTR="Gigster: Omar Trejo (omar.trejo@gigsternetwork.com) "

function tmux_email_mll() {
    tmux set -t "$1" status-right "$EMAIL_MLL"
}

function tmux_email_ggstr() {
    tmux set -t "$1" status-right "$EMAIL_GGSTR"
}

function tmux_email_cs() {
    tmux set -t "$1" status-right "$EMAIL_CS"
}

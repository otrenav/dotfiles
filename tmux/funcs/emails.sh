
EMAIL_MLL="ML Labs: Omar Trejo (omar@mllabs.com) "
EMAIL_PM="Pocket Made: Omar Trejo (omar@pocketmade.com) "
EMAIL_ORTH="Orthogonal: Omar Trejo (omar.trejo@orthogonal.io) "
EMAIL_CB="CrowdBotics: Omar Trejo (omar.trejo@crowdbotics.com) "
EMAIL_GGSTR="Gigster: Omar Trejo (omar.trejo@gigsternetwork.com) "

function tmux_email_mll() {
    tmux set -t "$1" status-right "$EMAIL_MLL"
}

function tmux_email_pm() {
    tmux set -t "$1" status-right "$EMAIL_PM"
}

function tmux_email_ggstr() {
    tmux set -t "$1" status-right "$EMAIL_GGSTR"
}

function tmux_email_orth() {
    tmux set -t "$1" status-right "$EMAIL_ORTH"
}

function tmux_email_cb() {
    tmux set -t "$1" status-right "$EMAIL_CB"
}

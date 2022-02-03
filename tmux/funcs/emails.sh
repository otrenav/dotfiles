
EMAIL_MLL="ML Labs: Omar Trejo (omar@mllabs.com) "
EMAIL_PM="Pocket Made: Omar Trejo (omar@pocketmade.com) "
EMAIL_GGSTR="Gigster: Omar Trejo (omar.trejo@gigsternetwork.com) "

function tmux_email_mll() {
    tmux set -t $1 status-right $EMAIL_MLL
}

function tmux_email_pm() {
    tmux set -t $1 status-right $EMAIL_PM
}

function tmux_email_ggstr() {
    tmux set -t $1 status-right $EMAIL_GGSTR
}

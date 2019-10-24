#!/bin/sh

pane=''
percentage=''

print_usage() {
    echo "\$ resize-width.sh -n <PANE_NUMBER> -p <PERCENTAGE>"
}

while getopts 'n:p:' arg; do
    case $arg in
        n) pane="$OPTARG" ;;
        p) percentage="$OPTARG" ;;
    esac
done

for arg in "$pane" "$percentage"; do
    if [ -z $arg ]; then
        print_usage
        exit 1
    fi
done

echo "Pane"
echo $pane
echo "Percentage"
echo $percentage

declare -i total num

total=$(tmux list-panes | awk -F'[' '{print $2}' | awk -F'x' '{print $1}' | awk '{sum+=$1}END{print sum}')
total+=$(tmux list-panes | wc -l)-1  # Compensate for vertical separators/lines

echo $total

# HEIGHT=$(($(tmux display-message -p '#{pane_height}') / 5))
# tmux resize-pane -y $HEIGHT

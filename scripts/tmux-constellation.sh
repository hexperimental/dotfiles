#!/bin/bash

SESSION="constellation"
DIR="$HOME/Code/constellation"

if ! command -v tmux &>/dev/null; then
    echo "tmux is not installed"
    exit 1
fi

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already exists"
    exit 0
fi

tmux new-session -d -s "$SESSION" -c "$DIR"
tmux set-option -t "$SESSION" status-position top
tmux set-option -t "$SESSION" status-style "bg=orange,fg=black"
tmux split-window -h -t "$SESSION" -c "$DIR"
tmux split-window -v -t "$SESSION:1.1" -c "$DIR"
tmux select-pane -t "$SESSION:1.3"

tmux attach-session -t "$SESSION"

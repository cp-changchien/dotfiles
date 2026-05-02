#!/bin/bash

selected=$(find "$HOME" -mindepth 1 -maxdepth 2 -type d 2>/dev/null \
    | sed "s|^$HOME/||" \
    | fzf)

[[ -z $selected ]] && exit 0

selected="$HOME/$selected"

selected_name=$(echo "$selected" | sed "s|$HOME||; s|/|-|g")

if tmux has-session -t "$selected_name" 2>/dev/null; then
    tmux switch-client -t "$selected_name"
else
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux switch-client -t "$selected_name"
fi

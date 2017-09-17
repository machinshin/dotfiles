#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 (right|left)"
  exit 1
fi

current_win=$(tmux display-message -p '#I')
total_win_count=$(tmux display-message -p '#{session_windows}')

case "$1" in
  "right")
    tmux swap-window -s :$current_win -t :$(( $current_win + 1 )) &> /dev/null
    if [ $? -ne 0 ]; then
      # It's on the rightmost position
      tmux swap-window -s :$current_win -t :1
    fi
    ;;
  "left")
    tmux swap-window -s :$current_win -t :$(( $current_win - 1 )) &> /dev/null
    if [ $? -ne 0 ]; then
      # It's on the leftmost position
      tmux swap-window -s :$current_win -t :$total_win_count
    fi
    ;;
  *)
    echo "Usage: $0 (right|left)"
    exit 1
    ;;
esac

view raw


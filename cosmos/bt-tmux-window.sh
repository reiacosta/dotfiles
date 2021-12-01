#!/bin/bash

working_dir() {
  local pane_id=$(tmux display-message -p "#{pane_id}")
  local tmux_env_var_name="TMUX_WORKING_DIR_$(tmux display-message -p '#{session_name}')_${pane_id//%/}"
  local tmux_value=$(tmux show-environment $tmux_env_var_name)
  if [ "$?" == "0" ]; then
    echo ${tmux_value#*=}
  else
    echo "~" # this should never happen, but i'm not omnicient so let's return something so i don't break everyone's tmux
  fi
}

cmd=$1
shift
path=$(working_dir)
window_name=""
params=""

while [ $# -gt 0 ]
do
  case "$1" in
    -n) window_name="$2"
        shift
        ;;
    *) params="$params $1";;
  esac
  shift
done

case $cmd in
  new-window)
    if [ -z "$window_name" ]; then
      tmux new-window $params -c "$path"
    else
      tmux new-window $params -n "$window_name" -c "$path"
    fi
    ;;
  split-window)
    tmux split-window $params -c "$path"
    ;;
esac

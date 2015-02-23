#! /bin/bash

tmux start-server

tmux new-session -d -s writermortis

tmux new-window -t writermortis:2 -n realtime
tmux select-window -t writermortis:2
tmux send-keys -t writermortis:2 "cd writermortis_realtime && nf start" C-m

tmux new-window -t writermortis:1 -n consle
tmux select-window -t writermortis:1
tmux send-keys -t writermortis:1 "cd writermortis2 && rails s" C-m
tmux split-window
tmux send-keys -t writermortis:1 "cd writermortis_client && ember serve" C-m

tmux attach -t writermortis

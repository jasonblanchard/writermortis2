#! /bin/bash

tmux start-server

tmux new-session -d -s writermortis

tmux select-window -t writermortis:0
tmux rename-window 'realtime'
tmux send-keys -t writermortis:0 "cd writermortis_realtime && nf start" C-m

tmux new-window -t writermortis:1 -n console
tmux select-window -t writermortis:1
tmux split-window -h
tmux select-pane -t 0
tmux send-keys -t writermortis:1 "cd writermortis_server && rails s" C-m
tmux split-window
tmux send-keys -t writermortis:1 "cd writermortis_client && ember serve --proxy http://localhost:3000" C-m
tmux select-pane -t 2
tmux send-keys -t writermortis:1 "cd writermortis_client && ember test --server" C-m

tmux attach -t writermortis

#!/bin/bash -x
#tmux_a() {
    ##tmux set-window-option -g automatic-rename on
    #tmux new-session -s a -d -n 'api' 'cd ~/workspace/ct/crowdtilt-internal-api' #>/dev/null 2>&1
    ##tmux new-window -k -t a:1
    #tmux new-window -t a:2 -n 'pub' 'cd ~/workspace/ct/crowdtilt-public-site' #>/dev/null 2>&1
##    tmux new-window -t a:3 -n 'vagrant' 'cd ~/workspace/ct/; vagrant ssh srv1' >/dev/null 2>&1
##    tmux new-window -t a:4 -n 'sql' 'cd ~/workspace/ct/; vagrant ssh srv1' >/dev/null 2>&1
    ##tmux new-window -t a:5 -n 'logs' 'cd ~/workspace/ct/; vagrant ssh srv1' >/dev/null 2>&1
    ##tmux new-window -t a:6 -n 'misc' 'cd ~/workspace/ct/' >/dev/null 2>&1

    ##tmux set-window-option -g automatic-rename off
    #tmux select-window -t a:0
    #tmux attach-session -t a
#}

make_session() {
    local session_name=$1
    local window_name=$2
    echo "session_name=$session_name"
    echo "window_name=$window_name"

    if ! type tmux >/dev/null 2>&1; then
        echo 'Error: tmux command not found' 2>&1
        exit 1
    fi
    if [ -n "$TMUX" ]; then
        echo "Error: tmux session has already been attached" 2>&1
        exit 1
    fi

    if tmux has-session -t "$session_name" >/dev/null 2>&1; then
        # detached session exists
        echo "tmux attach to existing session: $session_name"
        tmux attach -t "$session_name"
        exit 0
    fi

    # Start the session and window 0
    # This will also be the default cwd for new windows created
    # via a binding unless overridden with default-path.
    #cd ~

    tmux new-session -P -s $session_name -d -n 'api' 'cd ~/workspace/ct/crowdtilt-internal-api'
    #-n "$window_name:1" -d

    # Create a bunch of windows in your home directory
    # TODO
    # create window failed: index in use: 1
    #cd ~
    for i in {2..5}; do
        tmux new-window -t "$session_name:$i" -n "$window_name:$i" 'cd ~/workspace/ct/crowdtilt-internal-api'
        tmux split-window -v -t "$session_name" -p 50
        tmux select-pane -t "$session_name"
        #tmux send-keys -t "$session_name:$i" "man tmu" C-m
    done

    # Set the default cwd for new windows (optional, otherwise defaults to session cwd)
    #tmux set-option default-path /

    # Select window #1 and attach to the session
    tmux select-window -t "$session_name:1"
    tmux -2 attach-session -t "$session_name"

}
tamux () {
    make_session "a" "w"
}

tbmux () {
    make_session "b" "w"
}

tcmux () {
    make_session "t" "w"
}


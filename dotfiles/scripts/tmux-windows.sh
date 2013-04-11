#!/opt/local/bin/zsh
tmux_a() { 
  tmux new -d -s a
  tmux neww -t a:1 -n 'dev' 'cd ~/workspace/ct/'
  tmux neww -t a:2 -n 'api' 'cd ~/workspace/ct/crowdtilt-internal-api'
  tmux neww -t a:3 -n 'vagrant' 'cd ~/workspace/ct/; vagrant ssh srv1'
  tmux neww -t a:4 -n 'sql' 'cd ~/workspace/ct/; vagrant ssh srv1'
  tmux neww -t a:5 -n 'logs' 'cd ~/workspace/ct/; vagrant ssh srv1'

  tmux attach-session -t a
}

tmux_b() {
  tmux new -d -s b
  tmux neww -t b:1 -n 'dev' 'cd ~/workspace/ct/'
  tmux neww -t b:2 -n 'api' 'cd ~/workspace/ct/crowdtilt-internal-api'
  tmux neww -t b:3 -n 'vagrant' 'cd ~/workspace/ct/; vagrant ssh srv1'
  tmux neww -t b:4 -n 'sql' 'cd ~/workspace/ct/; vagrant ssh srv1'
  tmux neww -t b:5 -n 'logs' 'cd ~/workspace/ct/; vagrant ssh srv1'

  tmux attach-session -t b
}

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
tmux_c() {
  tmux new -d -s c
  tmux neww -t c:1 -n 'dev' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t c:2 -n 'api' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t c:3 -n 'vagrant' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t c:4 -n 'sql' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t c:5 -n 'logs' 'cd ~/workspace/github/sjsu/Nitro/'

  tmux attach-session -t c
}

tmux_d() {
  tmux new -d -s d
  tmux neww -t d:1 -n 'dev' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t d:2 -n 'api' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t d:3 -n 'vagrant' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t d:4 -n 'sql' 'cd ~/workspace/github/sjsu/Nitro/'
  tmux neww -t d:5 -n 'logs' 'cd ~/workspace/github/sjsu/Nitro/'

  tmux attach-session -t d
}


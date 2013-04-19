OS=`uname`

export LS_OPTIONS='--color=auto'
if [[ "$OS" == "Darwin" ]]; then
  PORTSBIN="/opt/local/bin/"
  DIRCOLORS="$PORTSBIN/gdircolors"
  alias ls="$PORTSBIN/gls $LS_OPTIONS "
else
  DIRCOLORS='/usr/bin/dircolors'
  alias ls="ls $LS_OPTIONS "
fi

eval `$DIRCOLORS ~/.dir_colors`

if [[ "$OS" == "Darwin" ]]; then
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/
fi

export CLI_COLOR='Yes'
set -o vi
alias grep='grep --color=auto'
alias gvim='gvim -geom 82x35'
alias hist='grep '$1' $HOME/.zsh_history'
alias mem='free -m'
alias rmdir='rm -rf '
alias sU='svn up'
alias la='ls -al'
alias f='find |grep'
alias lsd='ls -ld *(-/DN)'
alias c='clear'
alias cc='c;c;c;c'
alias p='pushd .'
alias u='popd'
alias ..='cd ..'
alias ...='cd ../..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../../'
alias ..5='cd ../../../../../../'
alias td='tmux detach'
alias ta='tmux attach -t a'
alias tb='tmux attach -t b'
alias tna='tmux new -s a'
alias tnb='tmux new -s b'
alias ll='ls -alh' 
alias vi='vim'
alias v='vim'
alias n='notes '
alias ack='ack-5.12'
alias a='ack-5.12'
alias gitd='git difftool --'
PATH=/opt/local/bin:opt/local/sbin:$PATH
export PATH=$JAVA_HOME/bin:$PATH

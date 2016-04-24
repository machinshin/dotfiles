OS=`uname`

export LS_OPTIONS='--color=auto'
if [[ "$OS" == "Darwin" ]]; then
    PORTSBIN="/usr/local/bin"
    DIRCOLORS="$PORTSBIN/gdircolors"
    alias gvim='mvim -v'
    alias ls="$PORTSBIN/gls $LS_OPTIONS "
    alias vi='mvim -v'
    alias vim='mvim -v'
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
alias a='ack'
alias c='clear'
alias f='find |grep'
alias fuck='sudo !!'
alias gip='git push origin HEAD'
alias gipf='git push -f origin HEAD'
alias grep='grep --color=auto'
alias hist="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias la='ls -al'
alias ll='ls -alh'
alias lsd='ls -ld *(-/DN)'
alias mem='free -m'
alias rmd='rm -rf '
alias td='tmux detach'
alias v='vim'
alias vi='vim'
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

r() {
    SSH_AUTH_SOCK=`tmux showenv|grep "^SSH_AUTH_SOCK" | cut -d = -f 2`
}

s() {
    [ -z $1 ] && return
    echo "switching to $1 branch"
    git checkout $1
}

psg() {
    ps axu | grep -v grep | grep "$@" -i --color=auto;
}


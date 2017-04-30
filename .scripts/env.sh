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
  alias v='vim'
  alias vi='vim'
fi

eval `$DIRCOLORS ~/.dir_colors`

if [[ "$OS" == "Darwin" ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
  export PATH=${JAVA_HOME}/bin:$PATH
fi

export CLI_COLOR='Yes'
set -o vi
alias a='ack'
alias c='clear'
alias gip='git push origin HEAD'
alias gipf='git push -f origin HEAD'
alias hist="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias la='ls -al'
alias ll='ls -alh'
alias l='ll'
alias lsd='ls -ld *(-/DN)'
alias mem='free -m'
alias rmd='rm -rf '
alias gtr='go test ./...'
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

psg() {
  ps axu | grep -v grep | grep "$@" -i --color=auto;
}

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-javascript}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "> $ @"
}


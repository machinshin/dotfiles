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
alias gs='git status'
alias gp='git push'
alias gf='git push -f'
alias hist="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias la='ls -al'
alias ll='ls -alh'
alias l='ll'
alias lsd='ls -ld *(-/DN)'
alias mem='free -m'
alias rmd='rm -rf '
alias gtr='go test ./...'
alias n='npm install --save '
alias nd='npm install --save-dev '

alias -g TC='| tee command.log'
alias -g T='| tee '
alias -g J="| jq '.'"
alias mg='git diff --name-status --diff-filter=U | sort | cut -f2'
alias s='git checkout '


#zsh specific alias
alias mmv='noglob zmv -W'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

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
source '/usr/local/share/zsh/site-functions'


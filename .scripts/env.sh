OS=`uname`

source '/usr/local/share/zsh/site-functions'
source <(npx --shell-auto-fallback zsh)

# export LS_OPTIONS='--color=auto'
if [[ "$OS" == "Darwin" ]]; then
  PORTSBIN="/usr/local/bin"
  # DIRCOLORS="$PORTSBIN/gdircolors"
  alias gvim='mvim -v'
  # alias ls="$PORTSBIN/gls $LS_OPTIONS "
  alias ls='exa --color-scale -G -F '
  alias vi='mvim -v'
  alias vim='mvim -v'
else
  # DIRCOLORS='/usr/bin/dircolors'
  alias ls='exa --color-scale -G -F'
  # alias ls="ls $LS_OPTIONS "
  alias v='vim'
  alias vi='vim'
fi

if [[ "$OS" == 'Darwin' ]]; then
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
alias gppd='git push && git push upstream develop'
alias hist="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias git-sync='git checkout develop && git pull upstream develop && git merge upstream/develop && git push'
alias git-sync-master='git checkout master && git pull upstream master  && git merge upstream/master && git push'

# FROM: https://jerel.co/blog/2011/07/generating-a-project-changelog-using-git-log
alias changelog="git-sync-master && git log master...develop --pretty=format:'<li><a href=\"https://github.com/Workerbee-ai/my-assistant-friday/commit/%H\">View Commit &bull;</a> %s</li>' | grep -v \"Merge\" > changelog.html && open changelog.html"
alias la='ls -al'
alias ll='ls -alh'
alias l='ll'
alias lsd='ls -ld *(-/DN)'
alias mem='free -m'
alias rmd='rm -rf '
#alias gtr='go test ./...'
alias n='npm '
alias ns='n i --save'
alias nr='npm run '
alias nd='npm install --save-dev '

alias -g TC='| tee command.log'
alias -g T='| tee '
alias -g J="| jq '.'"
alias mg='git diff --name-status --diff-filter=U | sort | cut -f2'
alias s='git checkout '
alias -g OVI=' -l | xargs -o vim'

#zsh specific alias
alias mmv='noglob zmv -W'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

export WEBSTORM_HOME=/Applications/WebStorm.app/Contents/MacOS
PATH=$PATH:${WEBSTORM_HOME}

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


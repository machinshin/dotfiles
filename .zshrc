start_time="$(date +%s)"
eval "$(hub alias -s)"
export EDITOR='mvim -v '
export SHELL='/usr/local/bin/zsh'
autoload -U zmv
autoload -Uz compinit
setopt correct_all
setopt NO_NOMATCH

#superglobs
setopt extendedglob
unsetopt caseglob
# http://nuclearsquid.com/writings/reporttime-in-zsh/
REPORTTIME=5

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
#If you end up using a directory as argument, this will
#remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

#history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

#fuzzy completions
zstyle ':completion:*' completor _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
#ignore completion for commands i don't have
zstyle ':completion:*:functions' ignored-patterns '_*'
#pids menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'
#cd never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Complete the hosts and directories. Try it:
#  $ scp file username@<TAB><TAB>:/<TAB>
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users
#--------------

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="machinshin"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"
# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
    \ dirpersist
    \ gitfast
    \ history
    \ themes
    \ vi-mode
    \ zsh-syntax-highlighting
    \ zsh_reload
    \ brew
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#zsh specifc alias
alias mmv='noglob zmv -W'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim cd'
export GOPATH=$HOME/workspace/github/GoPath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

SCRIPTS=( \
    $HOME/.scripts/corp.env.sh \
    $HOME/.scripts/env.sh \
    $HOME/.scripts/proj.env.sh \
    $HOME/.aws \
    $HOME/.fzf.zsh \
)

for (( i =1; i <= $#SCRIPTS; i++ )) do
    echo "running ${SCRIPT[i]}"
    [[ -f `${SCRIPTS[i]}` ]] && source `${SCRIPTS[i]}`
done

[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#source $(brew --prefix)/share/antigen.zsh

#this stops refresh issues with irssi && tmux in iterm2
alias irssi='TERM=screen-256color irssi'
alias -g TC='| tee command.log'
alias -g T='| tee '

export PATH=$PATH:/Applications:$HOME/.rvm/bin:~/workspace/github/rebar:$PATH:$HOME/.scripts


alias mg='git diff --name-status --diff-filter=U | sort | cut -f2'
compinit

alias s='git checkout '

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use stable

end_time="$(date +%s)"
echo ".zshrc: $((end_time - start_time)) seconds"


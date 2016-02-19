eval "$(hub alias -s)"
export PATH=$PATH:/Applications:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:~/workspace/github/rebar
export PATH=$PATH:$HOME/.scripts
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim cd'
export EDITOR='mvim -v '
export SHELL='/usr/local/bin/zsh'
autoload -U zmv
autoload colors;
colors
HISTFILE=~/.histfile
HISTSIZE=SAVEHIST=9999999
autoload -Uz compinit
setopt correctall
autoload -U promptinit
setopt hist_ignore_all_dups
setopt hist_ignore_space

setopt extended_history
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

#superglobs
setopt extendedglob
unsetopt caseglob
setopt interactivecomments # pound sign in interactive promt
REPORTTIME=10

#vi editing
bindkey -v
bindkey "^R" history-incremental-search-backward
#autoload -Uz bashcompinit
#bashcompinit
#source /usr/local/share/compleat-1.0/compleat_setup

ZCACHEDIR=~/.zsh/cache
zstyle ':completion:*' cache-path $ZCACHEDIR
zstyle ':completion:*' use-cache on
compinit -C -d $ZCACHEDIR/compdump
#color completions

zmodload -i zsh/complist
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'
zstyle ':completion:*' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
#history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# prevent svn files/dirs from being completd
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)SVN'
zstyle ':completion:*:cd*' ignored-patterns '(*/)#SVN'
#fuzzy completions
zstyle ':completion:*' completor _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# complete approx #'s increase w/ length
#zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
#ignore completion for commands i don't have
zstyle ':completion:*:functions' ignored-patterns '_*'
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
#menu selection for autocomplete
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
#pids menu selection
#zstyle 'completion:*:*:*:*:processes' menu yes select
#zstyle 'copmletion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
#If you end up using a directory as argument, this will
#remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true
#cd never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# I'm bonelazy ;) Complete the hosts and - last but not least - the remote
# directories. Try it:
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

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"
# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)


plugins=(autojump themes dirpersist history history-substring-search vi-mode zsh-syntax-highlighting gitfast)
#gnu-utils)
#vagrant tmux pip \
#themes knife tmuxinator rebar itunes \
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#zsh specifc alias
alias mmv='noglob zmv -W'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

if [[ -f $HOME/.scripts/corp.env.sh ]]; then
	source $HOME/.scripts/corp.env.sh
fi

if [[ -f $HOME/.scripts/env.sh ]]; then
	source $HOME/.scripts/env.sh
fi
if [[ -f $HOME/.scripts/proj.env.sh ]]; then
	source $HOME/.scripts/proj.env.sh
fi

if [[ -f $HOME/.aws ]]; then
	source $HOME/.aws
fi

[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

#this stops refresh issues with irssi && tmux in iterm2
alias irssi='TERM=screen-256color irssi'

alias -g TC='| tee command.log'
alias -g T='| tee '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

setopt NO_NOMATCH
alias mg='git diff --name-status --diff-filter=U | sort | cut -f2'
compinit

alias s='git checkout '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use stable

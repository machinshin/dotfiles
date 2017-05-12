#add zsh debugging
#setopt VERBOSE
#Add the following to your zshrc to access the online help:
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
# load zgen
source "${HOME}/.zgen/zgen.zsh"

export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)
# if the init scipt doesn't exist
if ! zgen saved; then

    zgen oh-my-zsh

    #zgen oh-my-zsh plugins/jira
    zgen oh-my-zsh plugins/autojump
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/dirpersist
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/gnu-utils
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/kubectl
    zgen oh-my-zsh plugins/taskwarrior
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/vi-mode

    zgen load bhilburn/powerlevel9k powerlevel9k
    zgen load djui/alias-tips
    zgen load supercrabtree/k
    zgen load tarruda/zsh-autosuggestions
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load littleq0903/gcloud-zsh-completion
    # generate the init script from plugins above
    zgen save
fi

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
eval "$(hub alias -s)"
export PATH=$PATH:~/workspace/github/rebar:$HOME/.scripts
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim cd'
export EDITOR='mvim -v '
export SHELL='/usr/local/bin/zsh'
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
nvm use stable
export GOPATH=$HOME/workspace/github/GoPath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"
source ~/.tmuxinator/completion.zsh
#[[ -s "$HOME/.rvm/scripts/rvm" ]]               && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#superglobs
setopt extendedglob
unsetopt caseglob
setopt NO_NOMATCH
REPORTTIME=10

#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
#zstyle ':completion:*' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
##history
#zstyle ':completion:*:history-words' stop yes
#zstyle ':completion:*:history-words' remove-all-dups yes
#zstyle ':completion:*:history-words' list false
#zstyle ':completion:*:history-words' menu yes

##fuzzy completions
#zstyle ':completion:*' completor _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
##pids menu selection
#zstyle ':completion:*:kill:*'   force-list always
##If you end up using a directory as argument, this will
##remove the trailing slash (usefull in ln)
#zstyle ':completion:*' squeeze-slashes true
##cd never select the parent directory (e.g.: cd ../<TAB>):
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

## I'm bonelazy ;) Complete the hosts and - last but not least - the remote
## directories.
##  $ scp file username@<TAB><TAB>:/<TAB>
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users

#zsh specifc alias
alias mmv='noglob zmv -W'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

#this stops refresh issues with irssi && tmux in iterm2
alias irssi='TERM=screen-256color irssi'

alias -g TC='| tee command.log'
alias -g T='| tee '
alias -g J="| jq '.'"
alias mg='git diff --name-status --diff-filter=U | sort | cut -f2'
alias s='git checkout '

[[ -f $HOME/.scripts/corp.env.sh ]] && source $HOME/.scripts/corp.env.sh
[[ -f $HOME/.scripts/env.sh ]]      && source $HOME/.scripts/env.sh
[[ -f $HOME/.scripts/proj.env.sh ]] && source $HOME/.scripts/proj.env.sh
[[ -f $HOME/.aws ]]                 && source $HOME/.aws

# (Zsh) "zsh-history-substring-search" plugin
# => zsh-history-substring-search customisation
setopt HIST_IGNORE_ALL_DUPS
# => Key bindings (for UP and DOWN arrow keys)
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#zsh theme config
#move to a theme file?

#NewLine
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="╰─ \$ "
# => Segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator status vcs background_jobs_joined vi_mode history context dir)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs background_jobs_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery)
POWERLEVEL9K_HISTORY_FOREGROUND='178'
POWERLEVEL9K_HISTORY_BACKGROUND='black'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %m/%d/%y}"
# `git hub colors`
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='119'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'
# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='160'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='236'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='214'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='030'
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VI_INSERT_MODE_STRING="(Ins)"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="(N)"
#directory
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='09'
#fish style
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

#temporary until this is fixed/revereted in POWERLEVEL9K
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N ale-line-finish
zle -N zle-keymap-select

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vat/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/vat/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vat/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/vat/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


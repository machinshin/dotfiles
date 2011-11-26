if [ "$TERM" != "dumb" ]; then
	export LS_OPTIONS='--color=auto'
	eval `/opt/local/bin/gdircolors ~/.dir_colors`
fi
export CLI_COLOR='Yes'
export PATH=/opt/local/bin:opt/local/sbin:$PATH
autoload -U zmv
set -o vi
autoload colors; colors
autoload -Uz compinit 
compinit
#vi editing
bindkey -v

#autoload -Uz bashcompinit
#bashcompinit
#source /usr/local/share/compleat-1.0/compleat_setup

ZCACHEDIR=~/.zsh/cache
zstyle ':completion:*' cache-path $ZCACHEDIR 
zstyle ':completion:*' use-cache on
compinit -C -d $ZCACHEDIR/compdump
#color completions

zmodload -i zsh/complist
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'
zstyle ':completion:*' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# history
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
zstyle ':completion:*:(ssh|scp|ftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp):*' users $users
#--------------
export PATH=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin:/maven3/bin:/opt/local/bin:opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$PATH
#export https_proxy=https://10.21.79.250:8080
#export http_proxy=http://10.21.79.250:8080
#export RSYNC_PROXY='http://10.21.79.250:8080'

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
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git dirpersist extract history-substring-search svn osx gnu-utils vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
#export JETTY_VERSION=7.5.4.v20111024

export PATH=/Applications:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin:/maven3/bin:/opt/local/bin:opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin:/maven3/bin:/opt/local/bin:opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin
alias trash="mv $1 ~/Trash"

# Customize to your needs...
#zsh specifc alias
alias mmv='noglob zmv -W'
alias ls='gls $LS_OPTIONS'
#----
#    export TERM=xterm; alias ls='ls --color=tty'
export M2_HOME=/maven3
export PATH=$M2_HOME/bin:$PATH
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export PATH=$JAVA_HOME/bin:$PATH
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias grep='grep --color=auto'
alias c='clear'
alias cc='c;c;c;c'
alias p='pushd .'
alias u='popd'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alh' 
alias maven='mvn'
alias mci='maven clean install'
alias mcit='maven clean install -Dmaven.test.skip=true'
alias runjetty='java -jar start.jar etc/jetty-ssl.xml -Dcom.abwg.configurl=file:///Users/sraghav1/workspace/mdf_streaming_deployment/config'
export PATH=$JAVA_HOME/bin/:$PATH
# on bash, also do: 
# export PS1="[\u@\h:\w] $ "




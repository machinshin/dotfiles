gip() {
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`
    echo `git push origin HEAD`
}

gipf() {
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`
    echo `git push -f origin HEAD`
}

psg() {
    ps axu | grep -v grep | grep "$@" -i --color=auto;
}

#Git ProTip - Delete all local branches that have been merged into HEAD
git_purge_local_branches() {
    BRANCH="dev"
    #DO_RUN = 0
    #if [ "$1" -eq "-r" ] then
        #DO_RUN=1
    #fi
    #if [ -n $2 ] then
        #BRANCH=$2
    #fi
    BRANCHES=`git branch --merged $BRANCH | grep -v '^*' | grep -v 'master' | grep -v 'dev' | grep -v "/$BRANCH$" | tr -d '\n'`
    echo "Running: git branch -d $BRANCHES"
    #if [ "$DO_RUN" -eq "1" ] then
        #git branch -d $BRANCHES
    #$fi
}

#Bonus - Delete all remote branches that are merged into HEAD (thanks +Kyle Neath)
git_purge_remote_branches() {
    [ -z $1 ] && return
    git remote prune origin
    BRANCHES=`git branch -r --merged $1 | grep 'origin' | grep -v '/master$' | grep -v '/dev$' | grep -v "/$1$" | sed 's/origin\//:/g' | tr -d '\n'`
    echo "Running: git push origin $BRANCHES"
    git push origin $BRANCHES
}

git_purge() {
    branch=$1
    [ -z $branch ] && branch="dev"
    git_purge_local_branches $branch
    git_purge_remote_branches $branch
}

# Exctract annnnything
extract () {
    if [ -f $1 ] ; then
        case $1 in
                *.tar.bz2)  tar xjf $1 ;;
                *.tar.gz)   tar xzf $1 ;;
                *.bz2)      bunzip2 $1 ;;
                *.rar)      unrar e $1 ;;
                *.gz)       gunzip $1 ;;
                *.tar)      tar xf $1 ;;
                *.tbz2)     tar xjf $1 ;;
                *.tgz)      tar xzf $1 ;;
                *.zip)      unzip $1 ;;
                *.Z)        uncompress $1 ;;
                *.7z)       7z x $1 ;;
                *)          echo "'$1' cannot be extracted via extract( ) " ;;
                 esac
    else
        echo "'$1' is not a valid file"
    fi
}

prod() {
    osascript ~/prod.applescript
}



pullreq() {
    [ -z $BRANCH ] && BRANCH="dev"
    [ -z $HEAD ] && return # Return if no head
    REMOTE=`cat .git/config | grep "remote \"origin\"" -A 2 | tail -n1 | sed 's/.*:\([^\/]*\).*/\1/'`
    MSG=`git log -n1 --pretty=%s`
    #CUR_BRANCH=${HEAD#refs/heads/}
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`

    if [[ "$CUR_BRANCH" == "dev" || "$CUR_BRANCH" == "master" ]]; then
      echo "You can't push directly to $CUR_BRANCH, thicky"
      return
    fi
    echo "CURRENT BRANCH is $CUR_BRANCH | $HEAD | $REMOTE | $MSG | $BRANCH"
    git push origin $CUR_BRANCH
    hub pull-request -b $BRANCH -h $REMOTE:$CUR_BRANCH
}

pcb() {
    ### TODO: how to get git commit to work?
    echo `git commit -m "$1"`
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`
    echo `git push origin $CUR_BRANCH`
}

gip() {
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`
    echo `git push origin $CUR_BRANCH`
}

gipf() {
    CUR_BRANCH=`git symbolic-ref --short -q HEAD`
    echo `git push -f origin $CUR_BRANCH`
}

psg() {
    ps axu | grep -v grep | grep "$@" -i --color=auto;
}

#Git ProTip - Delete all local branches that have been merged into HEAD
git_purge_local_branches() {
    [ -z $1 ] && return
    #git branch -d `git branch --merged $1 | grep -v '^*' | grep -v 'master' | grep -v 'dev' | tr -d '\n'`
    BRANCHES=`git branch --merged $1 | grep -v '^*' | grep -v 'master' | grep -v 'dev' | grep -v "/$1$" | tr -d '\n'`
    echo "Running: git branch -d $BRANCHES"
    git branch -d $BRANCHES
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
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar e $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
         esac
else
echo "'$1' is not a valid file"
     fi
}

# Tail a file and search for a pattern
t() {
    tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"
}

shc() {
    ssh -t ct "ssh -t $1";
}

prod() {
    osascript ~/prod.applescript
}
#export PATH=$PATH:/opt/local/lib/mysql55/bin/

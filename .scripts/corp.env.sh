export SL6=$HOME/workspace/github/6sl
alias pm='mysql --user=root --password=p@ssw0rd --show-warnings phrase_matrix'
alias pg.server='sudo -u postgres pg_ctl -D/usr/local/var/postgres'
alias pg.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias t='travis --pro '
alias pgnima='pgcli -h localhost -U root nima'

# Generate git format string on the fly to get the right top level directory
_gen_format_string() {
    echo "<a href=\"https://github.com/Crowdtilt/`basename $(git rev-parse --show-toplevel)`/commit/%h\" style='font-family:\"Courier new\"; color:red; font-weight:bold; text-decoration:none'>%h</a> %s <span style=\"color:green\">(%cr)</span> &lt;<span style=\"color:blue; font-weight:bold;\">%an</span>&gt;<br />"
}

# Generate the html output for this repo's deploy commits
_gen_html_output() {
    (
        cd $2
        git fetch upstream
        format=`_gen_format_string`
        output=`git log --no-merges origin/master..origin/dev --pretty=format:"$format" --abbrev-commit`
        if [ -n "$output" ]; then
            echo "<b style=\"font-size:16px;\">$3:</b><br /> <div class=\"anchor\"> <br />" >> $1
            echo "$output" >> $file
            echo "</div><br /><br />" >> $file
        fi
    )
}

gen_deploy_email () {
    if [ -z $1 ]; then
        echo "Usage: gen_deploy_email /path/to/crowdtilt/root"
        return 1
    fi

    file="/tmp/deploys.html"
    echo "<div style=\"font-family:sans-serif; font-size:13px;\">" > $file

    # Start format
    _gen_html_output "$file" "$1/crowdtilt-public-site" "Public Site"
    _gen_html_output "$file" "$1/crowdtilt-internal-api" "API"
    _gen_html_output "$file" "$1/site" "NuSite"

    echo "</div>" >> $file

    open $file
}

s() {
    [ -z $1 ] && return
    echo "switching to $1 branch"
    git checkout $1
}


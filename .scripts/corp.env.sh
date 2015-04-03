export CT=$HOME/workspace/ct
alias vs='vagrant status'

alias vs1='vagrant ssh srv1'
alias vu1='vagrant up srv1'
alias vh1='vagrant halt srv1 -f'
alias vd1='vagrant destroy srv1'
alias vr1='vagrant restart srv1'
alias vp1='vagrant provision srv1'

alias vs2='vagrant ssh srv2'
alias vu2='vagrant up srv2'
alias vd2='vagrant destroy srv2'
alias vr2='vagrant restart srv2'
alias vp2='vagrant provision srv2'

alias vs3='vagrant ssh srv3'
alias vu3='vagrant up srv3'
alias vd3='vagrant destroy srv3'
alias vr3='vagrant restart srv3'
alias vp3='vagrant provision srv3'
alias vbox_rs='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'
alias pm='mysql --user=root --password=p@ssw0rd --show-warnings phrase_matrix'

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


# the idea of this theme is to contain a lot of info in a small string, by
# compressing some parts and colorcoding, which bring useful visual cues,
# while limiting the amount of colors and such to keep it easy on the eyes.
# When a command exited >0, the timestamp will be in red and the exit code
# will be on the right edge.
# The exit code visual cues will only display once.
# (i.e. they will be reset, even if you hit enter a few times on empty command prompts)

typeset -A host_repr

local orange_bold="%B%F{130}"
local yellow_bold="%B%{$fg[yellow]%}"
# user part, color coded by privileges
local user="%(!.%{$fg[white]%}.%{$fg[red]%})%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
#local host="${orange_bold}$(hostname)%{$reset_color%}"
local host="${orange_bold}%m%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[white]%}%~%{$reset_color%}"
#local pwd="%{$fg[white]%}${$PWD/#$HOME/~}%{$reset_color%}"
#I don't recally care to see the current time on the prompt. waste of space
PROMPT='${yellow_bold}%h:%{$reset_color%}${user}@${host}($(git_prompt_info))[${pwd}] $ '

# i would prefer 1 icon that shows the "most drastic" deviation from HEAD,
# but lets see how this works out
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}?%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

#!/bin/bash

export HISTSIZE=30000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M-%S "

function go()
{
	if cd "$1" &> /dev/null ; then
		pushd . &> /dev/null
		pwd >> ~/.memory
	else
		s=`egrep -i "$1$" ~/.memory | tail -n 1`
		if [ "$s" == "" ] ; then
			echo "Sorry. Can't find \"$1\"."
		else
			pushd $s &> /dev/null
			pwd
		fi
	fi
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias scm='svn commit -m -'
alias ss='svn status'
alias sud='svn update'

alias g="git"
alias gcm='git commit'
alias "gcm-"='git commit -am -'
alias grl='git reflog | head'
alias gs='git status'
alias gd='git diff'
alias gf='git fetch'
alias gdf='git diff HEAD FETCH_HEAD'
alias gdfv='git diff HEAD FETCH_HEAD > /tmp/foo.diff ; vim /tmp/foo.diff'
alias gpll='git pull origin master'
alias gpsh='git push origin master'
alias gpshi='git push origin master:incoming'
alias ga='git add'
alias gb='git branch'
alias gcmp='git commit -m - -a ; git push'

alias l='ls -ltrh'
alias h='history | grep '
alias ht='history | tail -n 20'

alias v="vim"


#!/bin/bash

export HISTSIZE=30000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M-%S "

function oldgo()
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
function go()
{
    dst="$1"
    if pushd "$dst" &>/dev/null ; then	# if we cd there  okay ...
        pwd >> ~/.memory	# then remember new dir
		pwd					# and show it
    else
        dst=`egrep -i "$dst$" ~/.memory | tail -n 1`	# look for dir in memory
        if [ "$dst" != "" ] ; then	# if we find something that matches ...
            if pushd "$dst" &>/dev/null ; then	# and if we cd there okay ...
                pwd >> ~/.memory	# then remember dir dir
				pwd					# and show it
            fi
        else
            echo "Sorry. Can't find \"$1\"."
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
alias gpll='git pull '
alias gpsh='git push '
alias ga='git add'
alias gb='git branch -v'
alias gco='git checkout'
alias gcmp='git commit -m - -a ; git push'
alias grso='git remote show origin'

alias l='ls -ltrh'
alias h='history | grep '
alias ht='history | tail -n 20'

alias v="vim"

if [ ! -f ~/.vimrc ] ; then
	echo "Creating .vimrc file"
	echo "syntax on" > ~/.vimrc
	echo "set ts=4 sw=4 ai" >> ~/.vimrc
fi


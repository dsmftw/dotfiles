# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# Environment vars
NPMPATH=$HOME/.npm-global
export GOPATH=$HOME/.golang
export PATH=$PATH:$GOPATH/bin:$NPMPATH/bin

# Aliases
cp() { command cp -v "$@"; }
mv() { command mv -v "$@"; }
rm() { command rm -v "$@"; }
rmdir() { command rmdir -v "$@"; }
alias vimrc='vim $HOME/dotfiles/vimrc'
alias bashrc='vim $HOME/dotfiles/bashrc'

# Avoid duplicates on the shell history list
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# Get weather for city/airport using CLI
function weather() { curl -s wttr.in/"$*"?lang=ru | grep -vE "feature|Follow"; }

# Super extractor
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      7za x $1        ;;
      *.7z)       7zr x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


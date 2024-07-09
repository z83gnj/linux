#!/bin/bash
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

iatest=$(expr index "$-" i)

# Check fastfetch is installed, if so run it
if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Disable the bell
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Ignore case on auto-completion
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Show the current version of the operating system
ver() {
    . /etc/os-release
    echo "OS: $NAME"
    echo "Version: $VERSION_ID"
    echo "Codename: $VERSION_CODENAME"
    echo "Kernel: $(uname -r)"
}

# Function definitions
whatsmyip ()
{
    interfaces=$(ip -o link show | awk -F': ' '{print $2}' | grep -v 'lo')
	# Internal IP Lookup.
    for interface in $interfaces; do
	    if [ -e /sbin/ip ]; then
		    echo -n "Internal IP ($interface): "
		    /sbin/ip addr show $interface | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	    else
		    echo -n "Internal IP ($interface): "
		    /sbin/ifconfig $interface | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	    fi
    done
	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
    echo 
}

renew_ip() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: renew_ip <interface1> [<interface2> ...]"
        return 1
    fi

    for interface in "$@"; do
        echo "Renewing IP for interface: $interface"
        sudo dhclient -r "$interface" && sudo dhclient "$interface"
    done
}

renew_all_interfaces() {
    # Get the list of all network interfaces that are up
    interfaces=$(ip -o link show | awk -F': ' '{print $2}' | grep -v 'lo')

    for interface in $interfaces; do
        echo "Renewing IP for interface: $interface"
        sudo dhclient -r "$interface" && sudo dhclient "$interface"
    done
}

# Variable definitions

# Add to PATH the privat bin if exist
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin":$PATH"
fi

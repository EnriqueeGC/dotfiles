#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Mis alias
alias res1920x1080='xrandr --output HDMI-1 --mode 1920x1080 --rate 60'
PS1='\u \[\033[34m\] \[\033[0m\]\w\n\$ '
neofetch

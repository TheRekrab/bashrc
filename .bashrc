# My custom bashrc file.
# Designed by Nolan Barker

# PS1:

# Color variables

# SUPER COOL COLOR STUFF:
# The syntax of a color is as follows:
#
#  \[\033[ + NUM1 + ; + NUM2 + m\]
#

# NUM1 is the font-decorations, NUM2 is the color
# NUM1:
# 00: Resets text style
# 01: Plain text, uses most recent style, otherwise default.
# 02: Dull text
# 03: Italic text
# 04: Underlined text
# 05: Blinking text

# NUM2:
# 00: Resets color to white
# 01: Uses previous color, doesn't care.
# 30: Grey
# 31: Red
# 32: Green
# 33: Orange
# 34: Blue
# 35: Purple
# 36: Teal


# Color variables:
reset_color="\[\033[01;00m\]"
grey="\[\033[01;30m\]"
red="\[\033[01;31m\]"
green="\[\033[01;32m\]"
orange="\[\033[01;33m\]"
blue="\[\033[01;34m\]"
purple="\[\033[01;35m\]"
teal="\[\033[01;36m\]"

# Style variables:
reset_style="\[\033[00;01m\]"
dull="\[\033[02;01m\]"
italics="\[\033[03;01m\]"
underlined="\[\033[04;01m\]"
blinking="\[\033[05;01m\]"

# Reset variable:
reset_all="\[\033[00;00m\]"

# For my bashrc, you can either have a long or short prompt, already created!
if [[ $(id -u) -ne 0 ]];then
    ShortPS1=$dull$red"->"$reset_style$italics$purple"\u"$reset_style$blue" \W "$green"> "$reset_all

    LongPS1=$grey"["$dull$orange"\d \@"$reset_style$grey"] ("$italics$purple"\u"$reset_style$grey" @ "$italics$red"\H"$reset_style$grey") - "$blue"\w"$green" > "$reset_all
else
    ShortPS1=$dull$red"->"$reset_style$italics$red"\u"$reset_style$red" \W > "$reset_all
    LongPS1=$grey"["$dull$red"\d \@"$reset_style$grey"] ("$italics$red"\u"$reset_style$red" @ "$italics"\H"$reset_style$grey")"$red" - \w > "$reset_all
fi

PS1=$ShortPS1
# ALIASES:

alias grep="grep --color=auto"
alias ls="ls --color=auto -l"

# EXTRA:
# Some of this stuff is copied from the original bashrc:

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

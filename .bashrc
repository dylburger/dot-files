export PATH=${PATH}:/opt/local/bin

# vi shell keybindings
set -o vi

# System aliases
alias src=". ${HOME}/.bashrc && echo \"Your .bashrc file was re-read\" "
alias up='git pull && git submodule init && git submodule update && git pull'
alias c='clear'
alias ..='cd ..'

# Aliases for commonly-misspelled words
alias sl='ls'
alias l='ls'
alias s='ls'
alias ks='ls'

# SSH aliases, named by site to which they refer
alias tcdb='ssh satherdy@tcdb.grinnell.edu'
alias website='ssh dylansat@dylansather.info'
alias btrll='ssh -L 3128:192.168.6.20:3128 dylan@jump2.btrll.com'

# We need to set GPG_TTY for the gnupg vim plugin to work
GPG_TTY=`tty`
export GPG_TTY

HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# If we're on a Mac and have a .bashrc_mac file, read it
if [ -f ${HOME}/.bashrc_mac ] && [ -f /mach_kernel ]; then
  . ${HOME}/.bashrc_mac
fi

# If we're on a Linux machine and have a .bashrc_linux file, read it
if [ -f ${HOME}/.bashrc_linux ] && [ -f /proc/version ]; then
  . ${HOME}/.bashrc_linux
fi

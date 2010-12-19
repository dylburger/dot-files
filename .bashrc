export PATH=${PATH}:/opt/local/bin

# vi shell keybindings
set -o vi

# System aliases
alias src=". ${HOME}/.bashrc && echo \"Your .bashrc file was re-read\" "
alias up='git pull && git submodule init && git submodule update && git pull'
alias pull-dyl='git pull 192.168.1.10:~/docs/learning HEAD'
alias c='clear'

# Aliases for commonly-misspelled words
alias sl='ls'
alias l='ls'
alias ks='ls'

# SSH aliases, named by site to which they refer
alias tcdb='ssh satherdy@tcdb.grinnell.edu'
alias website='ssh dylansat@dylansather.info'
alias btrll='ssh -L 3128:192.168.6.20:3128 dylan@jump2.btrll.com'
alias conf1='ssh conf@66.54.159.124'
alias conf2='ssh brightrollconf2@66.54.159.122'
alias conf3='ssh brightroller@Bright-Rollers-Macbook-Pro-2.local'
alias conf4='ssh brightroll@66.54.159.121'
alias lobby='ssh lobby'
alias www='ssh www.brightroll.com'
alias kb='ssh kb.brightroll.com'
alias kb-int='ssh kb-int.brightroll.com'

# We need to set GPG_TTY for the gnupg vim plugin to work
GPG_TTY=`tty`
export GPG_TTY

# Mount website files in local directory
# sshfs dylansat@dylansather.info:public_html ~/Desktop/personal/website

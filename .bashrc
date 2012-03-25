export PATH=${PATH}:/opt/local/bin:/opt/local/sbin
export CLASS=${HOME}/personal/class
export PERSONAL_GIT_REPO=${HOME}/personal
export SCRIPT_REPO=${HOME}/scripts

# System aliases
alias src=". ${HOME}/.bashrc && echo \"Your .bashrc file was re-read\" "
alias up='git pull && git submodule init && git submodule update && git pull'
alias c='clear'
alias ..='cd ..'
alias ls-new='ls -tr | tail -1'
alias daily-notes='vi ${HOME}/notes/`date +%Y-%m-%d`'
alias tmux='tmux attach -d'
alias irb='irb --prompt simple'
alias ssh-socks='ssh -o "ProxyCommand /usr/bin/nc -x localhost:1080 %h %p"'
alias http='python -m SimpleHTTPServer'
alias verify='/usr/local/icinga/bin/icinga -v /usr/local/icinga/etc/icinga.cfg'
alias reload='/etc/init.d/icinga reload'

# SSH aliae
alias website='ssh dylansat@dylansather.info'

# Git aliae (n.b. some of these overwrite system programs, none of which I use, but some of which you may)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Run byobu for screen
alias screen='byobu'

# Aliases for commonly-misspelled words
alias ls='ls -p'
alias sl='ls'
alias l='ls'
alias s='ls'
alias ks='ls'
alias screem='screen'

# I will never run CVS but often fail to spell 'vi' correctly
alias ci='vi'

# We need to set GPG_TTY for the gnupg vim plugin to work
GPG_TTY=`tty`
export GPG_TTY

HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT
export EDITOR=vi

# TMUX
if which tmux 2>&1 >/dev/null; then
  # if no session is started, start a new session
  if test -z ${TMUX}; then
    tmux 
  fi
fi

if [ -f /opt/local/etc/profile.d/autojump.sh ]; then  
  . /opt/local/etc/profile.d/autojump.sh
fi

# If we're on a Mac and have a .bashrc_mac file, read it
if [ -f ${HOME}/.bashrc_mac ] && [ -f /mach_kernel ]; then
  . ${HOME}/.bashrc_mac
fi

# If we're on a Linux machine and have a .bashrc_linux file, read it
if [ -f ${HOME}/.bashrc_linux ] && [ -f /proc/version ]; then
  . ${HOME}/.bashrc_linux
fi

# Import .bashrc_br
if [ -f ${HOME}/.bashrc_br ]; then
  . ${HOME}/.bashrc_br
fi


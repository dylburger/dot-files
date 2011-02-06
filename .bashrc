export PATH=${PATH}:/opt/local/bin

# vi shell keybindings
set -o vi

# System aliases
alias src=". ${HOME}/.bashrc && echo \"Your .bashrc file was re-read\" "
alias up='git pull && git submodule init && git submodule update && git pull'
alias c='clear'
alias ..='cd ..'

# Run byobu for screen
alias screen='byobu'

# Aliases for commonly-misspelled words
alias sl='ls'
alias l='ls'
alias s='ls'
alias ks='ls'
alias screem='screen'

# SSH aliases, named by site to which they refer
alias tcdb='ssh satherdy@tcdb.grinnell.edu'
alias website='ssh dylansat@dylansather.info'
alias btrll='ssh -L 3128:192.168.6.20:3128 dylan@jump2.btrll.com'

# We need to set GPG_TTY for the gnupg vim plugin to work
GPG_TTY=`tty`
export GPG_TTY

HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT
export EDITOR=vi

# If we're on a Mac and have a .bashrc_mac file, read it
if [ -f ${HOME}/.bashrc_mac ] && [ -f /mach_kernel ]; then
  . ${HOME}/.bashrc_mac
fi

# If we're on a Linux machine and have a .bashrc_linux file, read it
if [ -f ${HOME}/.bashrc_linux ] && [ -f /proc/version ]; then
  . ${HOME}/.bashrc_linux
fi

# ssh-agent stuff...

SSH_ENV="$HOME/.ssh/environment"

# Start ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
  echo succeeded
  chmod 600 "$SSH_ENV"
  . "$SSH_ENV" > /dev/null
  ssh-add
}

# test for identities
function test_identities {
  # test whether our standard ids have been added to the agent
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $? -eq 0 ]; then
    ssh-add
    # $SSH_AUTH_SOCK is broken, start new agent
    if [ $? -eq 2 ]; then
      start_agent
    fi
  fi
}

# Check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
  ps -ewww | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
  if [ $? -eq 0 ]; then
    test_identities
  fi
# Otherwise, we might be able to load a PID from $SSH_ENV
else
  if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
  fi
  ps -ewww | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
  if [ $? -eq 0 ]; then
    test_identities
  else
    start_agent
  fi
fi

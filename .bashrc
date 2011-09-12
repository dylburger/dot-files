export PATH=${PATH}:/opt/local/bin:/opt/local/sbin:/Users/dylan/Desktop/personal/ec2/ec2-api-tools-1.4.4.1/bin

# System aliases
alias src=". ${HOME}/.bashrc && echo \"Your .bashrc file was re-read\" "
alias up='git pull && git submodule init && git submodule update && git pull'
alias c='clear'
alias ..='cd ..'
alias ls-new='ls -tr | tail -1'
alias take-notes='vi ${HOME}/notes/`date +%Y-%m-%d`'

# Run byobu for screen
alias screen='byobu'

# Aliases for commonly-misspelled words
alias ls='ls -p'
alias sl='ls'
alias l='ls'
alias s='ls'
alias ks='ls'
alias screem='screen'

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

# Import .bashrc_br
if [ -f ${HOME}/.bashrc_br ]; then
  . ${HOME}/.bashrc_br
fi

# ssh-agent stuff...
which -s ssh-agent
if [ $? -eq 0 ]; then

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
fi

# Same with gpg-agent
which -s gpg-agent
if [ $? -eq 0 ]; then
  if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
    SSH_AUTH_SOCK=`cat $HOME/.ssh-auth-sock`
    SSH_AGENT_PID=`cat $HOME/.ssh-agent-pid`
    export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
  else
    eval `gpg-agent --daemon`
    echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
    echo $SSH_AUTH_SOCK > $HOME/.ssh-auth-sock
    echo $SSH_AGENT_PID > $HOME/.ssh-agent-pid
  fi
fi

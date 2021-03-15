#Adams bashrc. 

. ~/.bash_aliases
source ~/.git-completion.bash
source ~/.git-prompt.sh

# History 
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth



#Git stuff 

#GIT_PS1_SHOWSTASHSTATE=1 #Shows stash status 
#GIT_PS1_SHOWUNTRACKEDFILES=1 #Shows if all files are tracked
#GIT_PS1_SHOWDIRTYSTATE=1 #Shows "cleaness"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1 #Adds color

# append to the history file, don't overwrite it
shopt -s histappend


#General

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


#Tools
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
#PS1='\[$(tput sc; tput rc)\][\u: \e[0;31m\]\w\[\e[0m\]]$(__git_ps1 " {%s}")> '
#PS1='\[[\u: \e[0;31m\]\w\[\e[0m\]]$(__git_ps1 " {%s}")]\> '
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#ADD colors to gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_DEFAULT_PROVIDER=libvirt

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# BEGIN SNIPPET: Magento Cloud CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET

# BEGIN SNIPPET: SymfonyCloud (PHP) CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.symfony-cloud-cli/bin':"$PATH"
if [ -f "$HOME/"'.symfony-cloud-cli/shell-config.rc' ]; then . "$HOME/"'.symfony-cloud-cli/shell-config.rc'; fi # END SNIPPET

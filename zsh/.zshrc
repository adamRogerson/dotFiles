# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adam/.oh-my-zsh"

plugins=(
  git
  colored-man-pages
#  zsh-autosuggestions
)

PROMPT='%(?.%F{green}+.%F{red}%?)%f %B%F{white}%3~%f%b %# '
#RPROMPT='%*'
#
#
#AWS CLI told me todo this
autoload bashcompinit && bashcompinit
export AWS_PROFILE=saml


#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{green}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh
source $HOME/Personal/dotFiles/zsh/aliases

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANGUAGE=en_IE
export LANG=en_IE.UTF-0
export LC_ALL=en_IE

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

#My own keys
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/adam/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

# BEGIN SNIPPET: Magento Cloud CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET

# BEGIN SNIPPET: SymfonyCloud (PHP) CLI configuration
HOME=${HOME:-'/home/adam'}
export PATH="$HOME/"'.symfony-cloud-cli/bin':"$PATH"
if [ -f "$HOME/"'.symfony-cloud-cli/shell-config.rc' ]; then . "$HOME/"'.symfony-cloud-cli/shell-config.rc'; fi # END SNIPPET

# Created by `userpath` on 2020-10-16 10:07:34
export PATH="$PATH:/home/adam/.local/bin"

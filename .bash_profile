
alias l='ls -la'

# Not necessary due to docker update to new OSX version
# eval "$(docker-machine env default)"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LANG=es_ES.UTF-8
export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8

export PATH="/Users/dpm/.local/bin:/Users/dpm/.cabal/bin:$PATH"

alias cpaws='ssh -i ~/.ssh/id_rsa_cpaws -F ~/.ssh/ssh-cpaws.cfg dev@cp-spark-01'
alias cpaws2='ssh -i ~/.ssh/id_rsa_cpaws -F ~/.ssh/ssh-cpaws.cfg dev@cp-spark-02'

# brew bash_completion
# http://davidalger.com/development/bash-completion-on-os-x-with-brew/
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# virtualenvwrapper
# export WORKON_HOME=~/venvs
# source /usr/local/bin/virtualenvwrapper.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

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



function git_status_prompt(){
    git_status="$(git status 2>&1)"
    if [[ ! -z "$(echo $git_status | grep fatal)" ]]; then
        echo -e '$'
    elif [[ ! -z "$(echo $git_status | grep clean | grep ahead)" ]]; then
        echo -e '\033[0;33m$\033[0m'
    elif [[ ! -z "$(echo $git_status | grep clean)" ]]; then
        echo -e '\033[0;32m$\033[0m'
    else
        echo -e '\033[0;31m$\033[0m'
    fi
}


function parse_git_branch () {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

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

# Set tab width
tabs 4

PS1="$GREEN${USER}@${HOSTNAME%%.*}$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "


set editing-mode vi
set -o vi


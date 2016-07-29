
# python venv stuff
export WORKON_HOME=$HOME/.virtualenvs # Where virtualenv will store the virtual environments
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true # (Optional) Prevent pip from installing packages globally


# If not running interactively, don't do anything!
[[ $- != *i* ]] && return





# aliases
alias ll="ls -lh"
alias la="ls -ah"
alias lal="ls -lah"
alias sls="screen -ls"








export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad






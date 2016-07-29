# If not running interactively, don't do anything!
[[ $- != *i* ]] && return


## --color is only needed for linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls="ls --color --group-directories-first"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # export EDITOR="/usr/local/bin/vim"
  # setup bash_completion this will fail if brew isn't installed
  . `brew --prefix`/etc/bash_completion
else
  echo "Unrecognized OS some settings not set."
fi


# python venv stuff
export WORKON_HOME=$HOME/.virtualenvs # Where virtualenv will store the virtual environments
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true # (Optional) Prevent pip from installing packages globally


# aliases
alias ll="ls -lh" # the --colors is so that ls colors appear in linux; not needed for mac because of CLICOLOR=1
alias la="ls -ah"
alias lal="ls -lah"
alias sls="screen -ls"



## Define Colors -- all lifted from rob's .bash_profile
# dark colors
DK=$'\e[0;30m'    # black
DR=$'\e[0;31m'    # red
DG=$'\e[0;32m'    # green
DY=$'\e[0;33m'    # yellow
DB=$'\e[0;34m'    # blue
DM=$'\e[0;35m'    # magenta
DC=$'\e[0;36m'    # cyan
DW=$'\e[0;37m'    # white
# light colors
LK=$'\e[1;30m'    # black
LR=$'\e[1;31m'    # red
LG=$'\e[1;32m'    # green
LY=$'\e[1;33m'    # yellow
LB=$'\e[1;34m'    # blue
LM=$'\e[1;35m'    # magenta
LC=$'\e[1;36m'    # cyan
LW=$'\e[1;37m'    # white
ENDCOLOR=$'\e[0m'  # End color

# Git status color
function git_color() {
    local git_status="$(git status 2> /dev/null)"
    
    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $DR
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $DM
    elif [[ $git_status =~ "Your branch is behind" ]]; then
        echo -e $DB
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $DG
    else 
        echo -en $DG
    fi
}






# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "  # this does the bash line colors and stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[33m\]\h:\[$DY\]\w\[\$(git_color)\]\$(__git_ps1)\[$ENDCOLOR\]:\$ " # this is rob's bash line

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[$LB\]\w\[\$(git_color)\]\$(__git_ps1)\[$ENDCOLOR\]:\$ " # backup of current best

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ " # combining the two bash lines

export CLICOLOR=1 # this makes ls show colors on a mac
export LSCOLORS=ExFxBxDxCxegedabagacad # specifies colors for mac

export LS_COLORS=$LS_COLORS:'di=1;34:ln=35:*.py=31:*.csv=33' # specifies colors for linux





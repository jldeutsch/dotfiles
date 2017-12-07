# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## --color is only needed for linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls="ls --color --group-directories-first"
#  source /etc/bash_completion.d/git  
elif [[ "$OSTYPE" == "darwin"* ]]; then   ## this means i'm on a mac
  # export EDITOR="/usr/local/bin/vim"
  # setup bash_completion this will fail if brew isn't installed

  brew_loc=$(which brew)
  if [[	${#brew_loc}>0 ]]; then
    . $(brew --prefix)/etc/bash_completion
#  else
#    echo 'brew no found, cannot set up bash completion'
  fi
else
  echo "Unrecognized OS some settings not set."
fi


# python venv stuff
venv_loc=$(which virtualenv)
if [[ ${#venv_loc}>0 ]]; then
  export WORKON_HOME=$HOME/.virtualenvs # Where virtualenv will store the virtual environments
  source /usr/local/bin/virtualenvwrapper.sh
  export PIP_REQUIRE_VIRTUALENV=true # (Optional) Prevent pip from installing packages globally
fi

# aliases
alias ll="ls -lh" # the --colors is so that ls colors appear in linux; not needed for mac because of CLICOLOR=1
alias la="ls -ah"
alias lal="ls -lah"
alias sls="screen -ls"
alias pycclean='find ./ -name "*.pyc" -delete'





## colors taken from Taylor McGann's blog
# regular colors
RK=$'\033[0;30m' # Black
RR=$'\033[0;31m' # Red
RG=$'\033[0;32m' # Green
RY=$'\033[0;33m' # Yellow
RB=$'\033[0;34m' # Blue
RP=$'\033[0;35m' # Purple
RC=$'\033[0;36m' # Cyan
RW=$'\033[0;37m' # White

# High Intensty
HK=$'\033[0;90m' # Black
HR=$'\033[0;91m' # Red
HG=$'\033[0;92m' # Green
HY=$'\033[0;93m' # Yellow
HB=$'\033[0;94m' # Blue
HP=$'\033[0;95m' # Purple
HC=$'\033[0;96m' # Cyan
HW=$'\033[0;97m' # White

ENDCOLOR=$'\e[0m'  # End color


# Git status color
function git_color() {
    local git_status="$(git status 2> /dev/null)"
    local git_prompt="git"


    # Add second catch for new git output
    if [[ ${#git_status} -eq 0 ]]; then
        echo -en 
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -en "${HY} $git_prompt"
    elif [[ $git_status =~ "Your branch is behind" ]]; then
        echo -en "${HM} $git_prompt"
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -en "${HG} $git_prompt"
    else 
        echo -en "${HR} $git_prompt"
    fi
}


function console_swag {
	local git_status="$(git status 2> /dev/null)"
	
	if [[ ${#git_status} -eq 0 ]]; then
		echo -e
	else
		echo -e $HB --  
	fi
}


# export PS1="\[\033[$DC\]\u\[\033[$DW\]@\[\033[$DG\]\h:\[$DY\]\w\[$ENDCOLOR\]\$(console_swag)\[\$(git_color)\]\$ " 
export PS1="\[$HC\]\u\[$HW\]@\[$HG\]\h\[$RC\]: \[$HY\]\w\$(console_swag)\$(git_color)\[$ENDCOLOR\]\n\$"


export CLICOLOR=1 # this makes ls show colors on a mac
export LSCOLORS=ExFxBxDxCxegedabagacad # specifies colors for mac

export LS_COLORS=$LS_COLORS:'di=1;34:ln=36:*.py=31:*.txt=33:*.ipynb=35:*.csv=33' # specifies colors for linux



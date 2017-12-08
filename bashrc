# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## --color is only needed for linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias ls="ls --color --group-directories-first"
#	source /etc/bash_completion.d/git  
elif [[ "$OSTYPE" == "darwin"* ]]; then
 #	export EDITOR="/usr/local/bin/vim"
 #	setup bash_completion this will fail if brew isn't installed

 	brew_loc=$(which brew)
	if [[	${#brew_loc}>0 ]]; then
		. $(brew --prefix)/etc/bash_completion
#	else
#		echo 'brew no found, cannot set up bash completion'
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
alias cll="clear; ls -lh"
alias cdd="cd ../.."



## colors taken from Taylor McGann's blog
# light colors
LK=$'\033[0;30m' # Black
LR=$'\033[0;31m' # Red
LG=$'\033[0;32m' # Green
LY=$'\033[0;33m' # Yellow
LB=$'\033[0;34m' # Blue
LP=$'\033[0;35m' # Purple
LC=$'\033[0;36m' # Cyan
LW=$'\033[0;37m' # White

# dark colors
DK=$'\033[0;90m' # Black
DR=$'\033[0;91m' # Red
DG=$'\033[0;92m' # Green
DY=$'\033[0;93m' # Yellow
DB=$'\033[0;94m' # Blue
DP=$'\033[0;95m' # Purple
DC=$'\033[0;96m' # Cyan
DW=$'\033[0;97m' # White

ENDCOLOR=$'\e[0m'  # End color


# Git status color
function git_color() {
    local git_status="$(git status 2> /dev/null)"
    if [[ ${#git_status}>0 ]]; then
	local git_prompt="($(git symbolic-ref --short -q HEAD))"
        
	if [[ $git_status =~ "Your branch is ahead of" ]]; then
           echo -en "${DY} $git_prompt"
        elif [[ $git_status =~ "Your branch is behind" ]]; then
           echo -en "${DP} $git_prompt"
        elif [[ $git_status =~ "nothing to commit" ]]; then
           echo -en "${DG} $git_prompt"
        else 
           echo -en "${DR} $git_prompt"
   	fi
    fi
}

function console_swag {
	local git_status="$(git status 2> /dev/null)"
	
	if [[ ${#git_status}>0 ]]; then
		echo -e $DB --  
	fi
}


export PS1="\[$DC\]\u\[$DW\]@\[$DG\]\h\[$LC\]: \[$DY\]\w\$(console_swag)\$(git_color)\[$ENDCOLOR\]\n\$"

export CLICOLOR=1 # this makes ls show colors on a mac
export LSCOLORS=ExFxBxDxCxegedabagacad # specifies colors for mac

export LS_COLORS=$LS_COLORS:'di=1;34:ln=36:*.py=31:*.txt=33:*.ipynb=35:*.csv=33' # specifies colors for linux




#Overwrite this inside the _env
show_host_in_ps1=yes
OPENAI_API_KEY=
export TEXT_LANDER_PATH=

export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZ=25000
export HISTCONTROL=ignoredups 

LS_COLORS='di=0;35:fi=0;37'
shopt -s cdspell
shopt -s nocaseglob
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the terminal background and text color
export TERM=xterm-256color

# Load the aliases if the file exists
if [ -f "$HOME/dotfiles/bash_aliases" ]; then
    source "$HOME/dotfiles/bash_aliases"
fi


# Loads environment variables if available
if [ -f "$HOME/dotfiles/bash_env" ]; then
    source "$HOME/dotfiles/bash_env"
fi


case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$show_host_in_ps1" = yes ]; then
    PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u@\h\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$'
else
    PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$'
fi



# function to set terminal title  
function tabtitle() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# Make sure this works on linux
function tabname {
  printf "\e]1;$1\a"
}

bind "set completion-ignore-case on"

#setting up colors on the terminal
export CLICOLOR=1
# LS Color Scheme off this tool:  http://geoff.greer.fm/lscolors/
export LSCOLORS=EafacadaBaeaeababacaca

###############################################################################
# Git 
###############################################################################

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GIT_PS1_SHOWDIRTYSTATE=true

# Check for uncommitted changes in the dotfiles repository
dotfiles_repo=~/dotfiles

if [ -d "$dotfiles_repo" ] && [ -d "$dotfiles_repo/.git" ]; then
  # Check if there are uncommitted changes
  git -C "$dotfiles_repo" diff --quiet || echo "Warning: Uncommitted changes detected in your ~/dotfiles repository!"
fi

# Function to check for remote branch changes in ~/dotfiles
check_git_remote_changes() {
  # Navigate to the ~/dotfiles directory
  cd ~/dotfiles || { echo "Failed to navigate to ~/dotfiles"; return 1; }

  # Make sure we're in a git repository
  if [ ! -d ".git" ]; then
    echo "Not a git repository!"
    return 1
  fi

  # Fetch the latest updates from the remote
  git fetch --quiet

  # Get the current branch
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  # Check if the local branch is behind the remote
  behind_count=$(git rev-list --count ${current_branch}..origin/${current_branch})

  if [ "$behind_count" -gt 0 ]; then
    echo "Warning: Your local branch is behind the remote by $behind_count commit(s). Run 'git pull' to update."
  fi
}

# Automatically check for remote changes in ~/dotfiles repo whenever a new shell starts
check_git_remote_changes

###############################################################################
# ChatGPT
###############################################################################

gpt() {
    # Check if API_KEY is set before defining and calling the function
    if [ -n "$OPENAI_API_KEY" ]; then
        local query="$1"
        local api_endpoint="https://api.openai.com/v1/chat/completions"
        response=$(curl -s -X POST "$api_endpoint" \
            -H "Authorization: Bearer $OPENAI_API_KEY" \
            -H "Content-Type: application/json" \
            -d "{
                \"model\": \"gpt-4\",  # Or \"gpt-4\" if available
                \"messages\": [{\"role\": \"system\", \"content\": \"You are a helpful assistant.\"}, 
                              {\"role\": \"user\", \"content\": \"$query\"}]
            }")
        reply=$(echo $response | jq -r '.choices[0].message.content')
        echo "Response: $reply"
    else
        echo "API key is not set. Please set the API_KEY variable."
    fi
}


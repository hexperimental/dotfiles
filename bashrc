# Check for interactive shell
#[[ $- != *i* ]] && return

# Git prompt (__git_ps1) — check common locations
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
elif [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
elif [ -f "$(brew --prefix 2>/dev/null)/etc/bash_completion.d/git-prompt.sh" ]; then
    source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
fi
# Fallback so PS1 doesn't error if none of the above exist
command -v __git_ps1 &>/dev/null || __git_ps1() { :; }

export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
#Overwrite this inside the _env
show_host_in_ps1=yes
export OPENAI_API_KEY=
export TEXT_LANDER_PATH=
export NOTES_DIR=

export EDITOR=nvim
export HISTSIZE=1000
export HISTFILESIZE=25000
export HISTCONTROL=ignoredups 

LS_COLORS='di=0;35:fi=0;37'
shopt -s cdspell
shopt -s nocaseglob
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
    #PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u@\h\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$'
    PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u@\h\[\033[01;32m\])-[\[\033[01;37m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$ '
else
    #PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$'
    PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u\[\033[01;32m\])-[\[\033[01;37m\]\w\[\033[01;32m\]]$(__git_ps1)\n└─\[\033[00m\]\$'
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

# Enable case-insensitive tab completion
if [[ "$-" == *i* ]]; then
    bind "set completion-ignore-case on"
fi

#setting up colors on the terminal
export CLICOLOR=1
# LS Color Scheme off this tool:  http://geoff.greer.fm/lscolors/
export LSCOLORS=EafacadaBaeaeababacaca

###############################################################################
# Functions
###############################################################################

meetingnote() {
    ##TEMPLATE="$NOTES_DIR/Meetings/Template.md"
    ##DEST_DIR="$NOTES_DIR/Meetings"
    #DEST_DIR=$NOTES_DIR/Archive/Daily\ Notes
    ## Generate filename with timestamp format YYYY-MM-DD--HH:mm.md
    #FILENAME="$(date '+%Y-%m-%d').md"
    #DEST_FILE=$DEST_DIR/$FILENAME

    local date=$(date +%F)
    local file="$HOME/Documents/Notes/Work/Archive/Daily Notes/$date.md"
    nvim "$file"
}

export -f meetingnote



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
  local repo=~/dotfiles

  if [ ! -d "$repo/.git" ]; then
    echo "Not a git repository!"
    return 1
  fi

  # Fetch the latest updates from the remote
  git -C "$repo" fetch --quiet

  # Get the current branch
  local current_branch
  current_branch=$(git -C "$repo" rev-parse --abbrev-ref HEAD)

  # Check if the local branch is behind the remote
  local behind_count
  behind_count=$(git -C "$repo" rev-list --count "${current_branch}..origin/${current_branch}")

  if [ "$behind_count" -gt 0 ]; then
    echo "Warning: Your local branch is behind the remote by $behind_count commit(s). Run 'git pull' to update."
  fi
}

# Automatically check for remote changes in ~/dotfiles repo whenever a new shell starts
#check_git_remote_changes

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
                \"model\": \"gpt-4\",
                \"messages\": [{\"role\": \"system\", \"content\": \"You are a helpful assistant.\"},
                              {\"role\": \"user\", \"content\": \"$query\"}]
            }")
        reply=$(echo "$response" | jq -r '.choices[0].message.content')
        echo "Response: $reply"
    else
        echo "API key is not set. Please set the API_KEY variable."
    fi
}


if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

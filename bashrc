
#Overwrite this inside the _env
show_host_in_ps1=yes
OPENAI_API_KEY=

export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZ=25000
export HISTCONTROL=ignoredups 

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
function set-title() {
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


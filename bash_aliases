#
# Overwriteable
alias notes='cd ~/Notes'
alias dots='cd ~/dotfiles'
alias code='cd ~/Code'

# Platform detection
if [[ "$(uname)" == "Darwin" ]]; then
    IS_MAC=true
else
    IS_MAC=false
fi

# General
alias :q='exit'
alias help='man'
alias quit='exit'

alias ..='cd ..'
alias ...='cd ../..'

alias lss='ls -alrtF'
if command -v eza &> /dev/null; then
    alias ls='eza -l --sort=modified --reverse'
fi

# Python
alias venv='source env/bin/activate'
alias mkvenv='python3 -m venv env && source env/bin/activate'

# Networking
if $IS_MAC; then
    alias iplocal="ipconfig getifaddr en0"
    ips() {
      echo "Local IP: $(ipconfig getifaddr en0)"
      echo "Public IP: $(curl -s https://ifconfig.me)"
    }
else
    alias iplocal="hostname -I | awk '{print \$1}'"
    ips() {
      echo "Local IP: $(hostname -I | awk '{print $1}')"
      echo "Public IP: $(curl -s https://ifconfig.me)"
    }
fi
alias ippublic='curl -s https://ifconfig.me && printf "\n"'

alias vimrc='nvim ~/dotfiles/vimrc'
alias bashrc='nvim ~/dotfiles/bashrc'
alias reload='source ~/dotfiles/bashrc'

if $IS_MAC; then
    alias dirtychrome="open -a Google\ Chrome --args --disable-web-security"
fi

# Docker
alias dockerps='docker ps -a'

function dockernuke() {
    docker restart $(docker ps -q)
}

# Git
alias updater="git pull origin dev"
alias pusher="git push origin dev"

# Colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# enable color support of ls on Linux via dircolors
if ! $IS_MAC && [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Open with default application (macOS has native open)
if ! $IS_MAC; then
    alias open='xdg-open'
fi

# SSH
macbox() {
    if [ -n "$1" ]; then
        TERM=xterm-256color ssh macbox -t "tmux attach -t $1"
    else
        TERM=xterm-256color ssh macbox
    fi
}

# Support cls
alias cls='clear'

# More informative commands
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'


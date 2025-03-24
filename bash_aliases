#
# Overwriteable 
alias notes='cd ~/Notes'
alias dots='cd ~/dotfiles'
alias code='cd ~/Code'

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
alias iplocal="hostname -I | awk '{print $1}'"
alias ippublic='curl -s https://ifconfig.me && printf "\n"'

ips() {
  echo "Local IP: $(hostname -I | awk '{print $1}')"
  echo "Public IP: $(curl -s https://ifconfig.me)"
}

alias vimrc='nvim ~/dotfiles/vimrc'
alias bashrc='nvim ~/dotfiles/bashrc'
alias reload='source ~/dotfiles/bashrc'


alias dirtychrome="open -a Google\ Chrome --args --disable-web-security"

# Docker
alias dockerps='docker ps -a'

function dockernuke() {
    docker restart $(docker ps -q)
}

# Git
alias updater="git pull origin dev"
alias pusher="git push origin dev"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    #alias ls='ls -lartF --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Open with default application
alias open='xdg-open'

# Support cls
alias cls='clear'

# More informative commands
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'


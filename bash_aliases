alias ls='ls -alrtF'
alias la='ls -A'
alias l='ls -CF'

# Python
alias venv='source env/bin/activate'
alias mkvenv='python3 -m venv env && source env/bin/activate'

# Networking
alias myip='curl ifconfig.me'
alias localip="hostname -I | awk '{print $1}'"


alias bashrc='vim ~/dotfiles/bashrc'
alias reload='source ~/dotfiles/bashrc'
alias vimrc='vim ~/dotfiles/vimrc'


alias dirtychrome="open -a Google\ Chrome --args --disable-web-security"

alias gs="git status"
alias updater="git pull origin dev"
alias pusher="git push origin dev"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls -lartF --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

bind "set completion-ignore-case on"

PATH="~/.composer/vendor/bin:$PATH"
PATH="/usr/share/pear:$PATH"
PATH="/usr/local/opt/ruby193/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/bin:$PATH"
PATH="/bin:$PATH"
PATH="/usr/sbin:$PATH"
PATH="/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
export PATH

export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml


###############################################################################
# LS Colors
###############################################################################

#setting up colors on the terminal
export CLICOLOR=1

# LS Color Scheme off this tool:  http://geoff.greer.fm/lscolors/
export LSCOLORS=EafacadaBaeaeababacaca

###############################################################################
# Git shit: 
###############################################################################

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

alias gs="git status"
alias gpu="git pull upstream develop"


###############################################################################
# Prompt 
###############################################################################

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
WHITE="\[\033[0;37m\]"

export PS1="\[\e[1m\]________________________________________________________________________________\n$WHITE\w$YELLOW\$(parse_git_branch)$NO_COLOR\n❕ \[\e[0m\]"

###############################################################################
# Aliases 
###############################################################################

alias sshvm="ssh -p 2222 ttsai@localhost"
# Vagrant Stuff
alias vup="cd /Users/anperez/Projects/EA/pulse-spark-localdev-wrapper/; vagrant up"
alias voff="cd /Users/anperez/Projects/EA/pulse-spark-localdev-wrapper/; vagrant halt"
alias cdv="cd /Users/anperez/Projects/EA/pulse-spark-localdev-wrapper"
alias vssh="cd /Users/anperez/Projects/EA/pulse-spark-localdev-wrapper/; vagrant ssh"

alias ls="ls -lart"
alias mysqlon="/usr/local/Cellar/mysql/5.6.19/bin/mysqld"
alias cdea="cd ~/Projects/EA"
alias reload="source ~/.bash_profile"
alias vibp="vim ~/.bash_profile"

# grep with color
alias grep='grep --color=auto'


alias dirtychrome="open -a Google\ Chrome --args --disable-web-security"


###############################################################################
# Utility Functions
###############################################################################
function tabname {
  printf "\e]1;$1\a"
}

#COLOR CHEATSHEET
## Regular Colors
#\[\033[0;30m\] # Black
#\[\033[0;31m\] # Red
#\[\033[0;32m\] # Green
#\[\033[0;33m\] # Yellow
#\[\033[0;34m\] # Blue
#\[\033[0;35m\] # Purple
#\[\033[0;36m\] # Cyan
#\[\033[0;37m\] # White

## High Intensty
#\[\033[0;90m\] # Black
#\[\033[0;91m\] # Red
#\[\033[0;92m\] # Green
#\[\033[0;93m\] # Yellow
#\[\033[0;94m\] # Blue
#\[\033[0;95m\] # Purple
#\[\033[0;96m\] # Cyan
#\[\033[0;97m\] # White

## Background
#\[\033[40m\] # Black
#\[\033[41m\] # Red
#\[\033[42m\] # Green
#\[\033[43m\] # Yellow
#\[\033[44m\] # Blue
#\[\033[45m\] # Purple
#\[\033[46m\] # Cyan
#\[\033[47m\] # White

## High Intensty backgrounds
#\[\033[0;100m\] # Black
#\[\033[0;101m\] # Red
#\[\033[0;102m\] # Green
#\[\033[0;103m\] # Yellow
#\[\033[0;104m\] # Blue
#\[\033[10;95m\] # Purple
#\[\033[0;106m\] # Cyan
#\[\033[0;107m\] # White

#Replace any leading leading 0; with 1; for bold colors
#Replace any leading 0; with 4; to underline

# Simple stub bash_profile

export PATH="$PATH:/opt/homebrew/bin"
export EDITOR="vim"

parse_git_branch() {
    BRANCH=$(/usr/bin/git branch 2> /dev/null | /usr/bin/sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
    if [ ! -z $BRANCH ];
    then
       echo "$BRANCH "
    fi
}

set-title() {
  TITLE="\[\e]2;$*\a\]"
  printf $TITLE
}

oldprompt() {
    PROMPT_COMMAND=""
    PS1="[\u@\h] \w \$(parse_git_branch)>> "
}

PS1="[\u@\h] \w \$(parse_git_branch)>> "

alias flushdns='sudo killall -HUP mDNSResponder'
alias ll='ls -laF'

export WORKON_HOME=~/virtualenvs
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# git
alias br='git branch'
alias brhead='git branch --sort=-committerdate | head'
alias co='git checkout'
alias pu='git pull'
alias gr='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias brlast='git branch --sort=-committerdate | head'
alias brthis='git rev-parse --abbrev-ref HEAD'
alias st='git status'
alias gdn='git diff --name-only'

# git blame wrapper
bl() {
  git blame -L$1,$1 $2
}

alias k="kubectl"

# docker compose
alias dcd="docker-compose down"
alias dcl="docker-compose logs -f"
alias dcp="docker-compose ps"

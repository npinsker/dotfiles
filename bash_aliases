alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gg='git grep'
alias gc="git commit"
alias ga="git add"
alias gs="git status"
alias gst="git stash pop"

g()
{
  cd $1 && ls
}

ggo()
{
  vim $(git grep "$1" | awk -F":" '{ print $1 }')
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# tmux 256-color support
alias tmux='tmux -2'

alias diff-base='git diff ${u}...HEAD'

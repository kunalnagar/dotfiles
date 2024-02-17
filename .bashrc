parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

PS1="\n"
PS1+="\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)"
PS1+="\n"
PS1+="$ "
export PS1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="/usr/local/sbin:$PATH"

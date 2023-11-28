parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

precmd() {
    precmd() {
        echo
    }
}

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

autoload -U colors && colors

setopt PROMPT_SUBST
export PROMPT='$fg[cyan]%m:$fg[yellow] %T %B%30<..<%~%b $(parse_git_branch)
$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# auto-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

ip_local() {
  hostname -I | awk '{print $1}'
}

alias ip_public="dig +short myip.opendns.com @resolver1.opendns.com"
alias c="cd /Volumes/APTECH_1TB/Code"

export PATH="/usr/local/sbin:$PATH"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\n"
PS1+="\u at \w\$(parse_git_branch)"
PS1+="\n"
PS1+="$ "
export PS1

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

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# for file in ~/dotfiles/config/.{aliases}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git get current branch
git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Minimal prompt
PS1="\[\033[01;32m\]\w"   				                  # current directory
PS1+=" "
PS1+="\[\[\033[01;34m\]\e\ $(git_branch)\[\e[m\]"   	# current git branch
PS1+="\n"
PS1+="=> "
export PS1;
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH

NODE_PATH="/Users/samuel.swanke/.nvm/versions/node/v7.9.0/bin/node"

PATH="~/Git/build/bin:${PATH}"
export PATH

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH

PATH=$PATH:/usr/local/sbin
export PATH

# MySQL
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Sublime Text
export PATH="~/bin:$PATH"

# Change Java Version on the fly
alias usejava6='export JAVA_HOME=`/usr/libexec/java_home -v 1.6`'
alias usejava7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7`'
alias usejava8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8`'

#hound
alias hound='cd ~/Documents/hound;/Users/samuel.swanke/go/bin/houndd'
alias h='cd ~/Documents/hound;/Users/samuel.swanke/go/bin/houndd'

# Delete branch
deletebranch () {
  if [ ! "$#" -ne 1 ]
    then
      git branch -d "$1";
      git push origin :"$1";
    else
      echo Enter a valid branch name
  fi
}

# Terraform
alias tfgraph='terraform graph | dot -Tpng -o tfgraph.png'

# Get the weather!
alias weather="curl wttr.in/burlington_vermont"

# Bash Completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git Completions
. ~/git-completion.bash

_complete_ssh_hosts (){
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | \
    sed -e s/,.*//g | \
    grep -v ^# | \
    uniq | \
    grep -v "\[" ;
    `
  COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
  return 0
}
complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts sftp
complete -F _complete_ssh_hosts scp

# Git branch in prompt
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# Git Prompt
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[00;31m\]\u\[\033[00m\] in \[\033[01;36m\]\W\[\033[00m\]\[\033[00;32m\]$(__git_ps1 " (%s)")\[\033[00m\]$ '
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

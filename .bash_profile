PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH

PATH=$PATH:/usr/local/sbin
export PATH

export ANDROID_HOME=~/Library/Android/sdk
export NVM_DIR="/Users/samuel.swanke/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Sublime Text
export PATH="~/bin:$PATH"

# Change Java Version on the fly
alias usejava6='export JAVA_HOME=`/usr/libexec/java_home -v 1.6`'
alias usejava7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7`'
alias usejava8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8`'

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

# Prompt
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\033[00;31m\u\033[00m in \033[01;36m\W\033[00m\033[00;32m$(__git_ps1 " (%s)")\033[00m$ '

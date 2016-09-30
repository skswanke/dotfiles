
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH

PATH="~/Git/build/bin:${PATH}"
export PATH

PATH=$PATH:/usr/local/sbin
export PATH

export ANDROID_HOME=~/Library/Android/sdk
export NVM_DIR="/Users/samuel.swanke/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda3 4.0.0 installer
export PATH="/Users/samuel.swanke/anaconda/bin:$PATH"

# Sublime Text
export PATH="~/bin:$PATH"

# Change Java Version on the fly
alias usejava6='export JAVA_HOME=`/usr/libexec/java_home -v 1.6`'
alias usejava7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7`'
alias usejava8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8`'

# Run Apps
alias run-mp='cd ~/Git/cc-marketplace; usejava7; mvn grails:run-app'
alias run-om='cd ~/Git/order-manager/; usejava7; mvn tomcat6:run'
alias run-pui='cd ~/Git/prince-order-ui/; spar run'
alias run-prince='cd ~/Git/primary-intake-of-corporate-enrollment/; usejava8; mvn spring-boot:run'
alias run-pop='cd ~/Git/provisioning-too/; rabbitmq-server; usejava8; mvn spring-boot:run'
alias run-all='cd ~/Git/account-lifecycle-listener/; usejava8; mvn spring-boot:run'

# Build Apps
alias build-mp='cd ~/Git/cc-marketplace; usejava7; mvn install'
alias build-om='cd ~/Git/order-manager/; usejava7; mvn install'
alias build-prince='cd ~/Git/primary-intake-of-corporate-enrollment/; usejava8; mvn install'
alias build-pop='cd ~/Git/provisioning-too/; rabbitmq-server; usejava8; mvn install'
alias build-all='cd ~/Git/account-lifecycle-listener/; usejava8; mvn install'

# Get the weather!
alias weather="curl wttr.in/burlington_vermont"

# Bash Completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git Completions
. ~/git-completion.bash

export REMOTE_CONFIG_HOST="vtfwk-zookeeper01.dealer.ddc,vtfwk-zookeeper02.dealer.ddc,vtfwk-zookeeper03.dealer.ddc,vtfwk-zookeeper04.dealer.ddc,vtfwk-zookeeper05.dealer.ddc"
launchctl setenv REMOTE_CONFIG_HOST "$REMOTE_CONFIG_HOST"

export MAVEN_OPTS="-Xmx2028m -XX:MaxPermSize=768m -Djava.security.auth.login.config=/etc/remote_config/zookeeper_jaas.conf -javaagent:/Users/samuel.swanke/Git/build/lib/spring-instrument-3.1.0.RELEASE.jar -Dorg.mortbay.xml.XmlParser.NotValidating=true"

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
export PS1='\033[00;31m\u\033[00m in \033[01;36m\W\033[00m\033[00;32m$(__git_ps1 " (%s)")\033[00m$ '

#export EC2_HOME=~/.ec2
#export PATH=$PATH:$EC2_HOME/bin
#export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
#export EC2_CERT=`ls $EC2_HOME/cert-*.pem`

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

#eval "$(rbenv init -)"

# Custom colors
PS1='\[\033[0;35m\]\u@\h\[\033[0;33m\] \w\[\033[00m\]: '

# Dynamically add the git branch to the terminal output
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  case $TERM in
    xterm*)
    TITLEBAR='\[\033[0;35m\]\w\[\033[00m\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR} \[\033[0;34m\]\$(parse_git_branch)\[\033[00m\]: "
}
proml

source ~/.bashrc

# Move up a directory a certain number of times. Example: mcd 5 will go up 5 directories
mcd () { cd $(printf "../%.s" $(seq 1 $1)); }
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Make coreutils available on the path
PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Application path for installing cask apps
HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Git bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Docker client
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/$USER/.docker/machine/machines/default
export DOCKER_MACHINE_NAME="default"

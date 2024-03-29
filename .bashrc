export EDITOR=vim

alias share='python3 -m http.server 8080'
alias ls='ls -lG'
alias python='python3'
alias pip='pip3'
alias gb='git branch'
alias gc='git checkout'
alias gp='git pull'
alias gs='git status'
alias gsfn="gs | grep -A10000 Unmerged | sed 's/^[[:space:]a-z]*:[[:space:]]*//' | tail -n +3 | tr '\n' ' '"
alias gd='git diff'
alias curl='curl -v'
alias tf='terraform'
export PS1="\u:\w\$ "
alias diff="diff -u"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias less="less -X"
alias dockerclean="docker ps -qa | xargs docker kill ; docker ps -qa | xargs docker rm; docker system prune -f"
#alias dockerrun="docker run --rm -it $(docker build -q .)"
alias grep="grep --colour"
alias cal='gcal --starting-day=1 -q GB_EN .'
alias gcal='gcal --starting-day=1 -q GB_EN'
alias bells='for x in {1..5}; do tput bel; done'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'
alias autopep8='autopep8 --in-place --recursive'
alias nosleep='caffeine' # UBUNTU
#alias nosleep='caffeinate -id' # MAC https://nosleep.page/ or as an option on non mac pages
#alias oksleep='killall caffeinate' #MAC
alias oksleep='killall caffeine'


export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



#export GOPATH=$HOME/Go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$HOME/.rbenv/shims
#export PATH=$PATH:$HOME/.rbenv/bin
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH=$PATH:/Users/niall.bunting/Library/Android/sdk/platform-tools
export CDPATH=.:~/work

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias cd='>/dev/null cd'

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

#eval "$(rbenv init -)"


#export AWS_ACCESS_KEY_ID=
#export AWS_SECRET_ACCESS_KEY=
#export AWS_DEFAULT_REGION=
#export NPM_TOKEN=


## Ubuntu commands
alias pbcopy='xclip -selection c'

## WSL COMMANDS

#alias pbcopy='clip.exe'
#alias passcopy='head -n1 | pbcopy ; (sleep 45 && echo "empty" | pbcopy)&'
#export DOCKER_HOST=tcp://localhost:2375
#sudo mount --bind /mnt/c /c

export ARTIFACTORY_USER=niall.bunting
export ARTIFACTORY_PWD=


# tabtab source for packages
# uninstall by removing these lines
#[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# Josh P - made this
killport() {
  
  port=$1
  pid=$(lsof -ti:$port)

  if [ -z $pid ]; then
    echo "${Yellow}No process running on port: $port${Text_Reset}"
    return 1
  fi
  
  name=$(ps -p $pid -o comm=)
  kill -9 $pid
  echo "${Green}Killed process $name with id $pid running on port $port${Text_Reset}"
} 

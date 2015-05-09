setopt autocd
setopt correct
setopt correctall
setopt inc_append_history
setopt share_history

alias bundle='nocorrect bundle'
alias spring='nocorrect spring'
alias -r rm='rm -i'
alias -r l='ls -lha'
alias -r ssh='ssh -A'
alias -r ..='cd ..'
alias -r g='git'

PS1='[%m:%2c] %n%% '

autoload -U compinit
compinit

export PATH=$HOME/.rbenv/bin:~/bin:/usr/local/bin:/opt/local/bin:/usr/local/mysql/bin:/Applications:$HOME/bin/AWS-ElasticBeanstalk-CLI-2.6.3/eb/macosx/python2.7:$PATH
eval "$(rbenv init -)"

export GATEWAY_USER=jhalesga

source "$HOME/.secrets"

# Methods
#

# rbenv-rebuild - update all rbenv system
#
rbenv-rebuild() {
	cd ~/.rbenv && git pull
  cd ~/.rbenv/plugins/ruby-build && git pull
}

# grr - Recursive grep
#
grr() {
  buffer=($*)
  dir=$buffer[1]
  start=$buffer[2]
  cmd='grep -R '"${start} ${dir}"
  for i in $buffer[3,-1]; do
    cmd=${cmd}' | grep '${i}
  done
  eval $cmd
}

cuke() bundle exec cucumber $1 $*
stunnel() { ssh -R 52698:127.0.0.1:52698 $1 }


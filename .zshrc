setopt autocd
setopt correct
setopt correctall
setopt inc_append_history
setopt share_history

alias -r rm='rm -i'
alias -r l='ls -lha'
alias -r ssh='ssh -A'
mate() { open $1 -a TextMate }
cuke() bundle exec cucumber $1 $*
spec() bundle exec rspec $1 $*
stunnel() { ssh -R 52698:127.0.0.1:52698 $1 }

export PATH=~/bin:/opt/pdflabs/pdftk/bin:/usr/local/bin:/opt/local/bin:/usr/local/mysql/bin:/Applications:$PATH

PS1='[%m:%2c] %n%% '

autoload -U compinit
compinit

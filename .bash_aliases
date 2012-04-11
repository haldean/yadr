alias pkginstall='sudo apt-get install'
alias pkgsearch='apt-cache search'
alias pkgupdate='sudo apt-get update; sudo apt-get upgrade'

alias edit='emacs -nw'
alias djangoserver='./manage.py runserver 0.0.0.0:8000'

alias ..='cd ..'
alias mkdir='mkdir -p'
alias e='emacs'
alias se='sudo emacs'
alias df='df -h -x none'
alias free='free -m'
alias clearsign='gpg --armor --clearsign'
alias c='clear'
alias u='urxvt -tr- sh 80 -fg white'
alias pacman='sudo pacman'
alias aur='paktahn'
alias pinstall='sudo python setup.py install'

# These all have X-less and X-full versions because I usually
# don't use X and I don't want to wait for the X-client to start.
alias r-pi='ssh -Y pices.dynalias.org'
alias l-pi='ssh -Y 192.168.0.100'
alias clic='ssh -Y whb2107@clic.cs.columbia.edu'
alias cunix='ssh -Y whb2107@cunix.cc.columbia.edu'
alias alux='ssh -Y 192.168.0.102'
alias r-pi-x='ssh -X pices.dynalias.org'
alias l-pi-x='ssh -X 192.168.0.100'
alias clic-x='ssh -X whb2107@clic.cs.columbia.edu'
alias cunix-x='ssh -X whb2107@cunix.cc.columbia.edu'
alias alux-x='ssh -X 192.168.0.102'

alias gits='git status'
alias gitc='git commit -m'
alias gitca='git commit -a -m'
alias gitp='git push'
alias gita='git add'
alias gitd='git diff'

alias lispwc='cat *.lisp | grep -ve "^[\s]*$" | grep -ve ";;" | grep -ve "^\s*\"" | grep -ve "\"$" | wc -l'

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
plugins=(git zsh-syntax-highlighting)

autoload -U vim-widget

source $ZSH/oh-my-zsh.sh

# Fix tmux colors
alias tmux="TERM=screen-256color-bce tmux"

# path updates
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/maxlikely/bin
export PATH=/Users/maxlikely/projects/julia:$PATH
export PATH=/Users/maxlikely/.rvm/gems/ruby-1.9.3-p194/bin:/Users/maxlikely/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/maxlikely/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/maxlikely/.rvm/bin:$PATH
export PATH=$PATH:/opt/local/bin

export DATA_PATH=/Users/maxlikely/data
export data=/Users/maxlikely/data

export PYTHONPATH=/usr/local/lib/python:/Users/maxlikely/Dropbox/code:$PYTHONPATH
export PYTHONPATH=/Users/maxlikely/projects/ArabicNLP:$PYTHONPATH

export PYSOURCE=/usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7
export SCALA_HOME=/usr/local/Cellar/scala/2.10.0/libexec/

export VISUAL="mvim -f"


# for working shortcuts
TODAY=`date +'%y-%m-%d-%a' | tr '[A-Z]' '[a-z]'`
YESTERDAY=`date -v -1d +'%y-%m-%d-%a' | tr '[A-Z]' '[a-z]'`

CURRENT_WORK="/Users/maxlikely/Dropbox/archive/$TODAY"
PREVIOUS_WORK="/Users/maxlikely/Dropbox/archive/$YESTERDAY"

# coding aliases
alias pylab="ipython qtconsole --pylab=inline &"
alias notebook="ipython notebook --pylab inline &"
alias clean="rm *.pyc *.class *.out &> /dev/null"
alias pushall="git push; git push heroku"
alias init_git="git init; git add .; git commit -m \"Initial commit\""
alias ann="bundle exec annotate --position before"
alias view="open /Applications/Google\ Chrome.app/ http://127.0.0.1:3000"

# Binghamton Servers
alias bing="ssh dlundgren@node00.cs.binghamton.edu"
alias bingx="ssh -X dlundgren@node00.cs.binghamton.edu"

# Illinois Servers
alias cs="ssh lundgre4@dcs-linux-ts1.cs.illinois.edu"
alias csx="ssh -X lundgre4@dcs-linux-ts1.cs.illinois.edu"
alias cg="ssh lundgre4@130.126.114.121"
alias check="ssh davidl@check.u-author.com"
alias bab="ssh davidl@babbage"
alias beck="ssh david@beckman"
alias thesis="cd /Users/maxlikely/projects/argument-summarizing/experiments"
alias arabic="cd ~/projects/arabic-semantics/"

function mkcd(){
    mkdir -p $1;
    cd $1;
}

function settitle(){
    echo -ne "\033]0;$1\007"
}

function accomplished(){
    echo "$1" >> $CURRENT_WORK/summary.txt
}

function todo(){
    echo "$1" >> /Users/maxlikely/Dropbox/TODO/list
}

export CURRENT_PROJECT="$HOME/projects/arabic-semantics/src"

# to go to my code
alias cdd="cd ~/Desktop"
alias code="cd ~/projects/"
alias makework="mkcd ~/Dropbox/archive/$TODAY; ln -s ~/Dropbox/archive/$TODAY ~/Desktop/$TODAY"
alias data="cd ~/data"
alias exp="cd ~/Dropbox/code/Experiments"

alias go="./.go.zsh"

#make my ls diplay colors
export LSCOLORS=exfxcxdxbxexexabagacad
#alias ls="ls -G"
alias hibernate="pmset -a hibernatemode 25 force; pmset sleepnow"


function hist(){
    awk '{h[$1]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}' |awk '!max{max=$1;}{r="";i=s=60*$1/max;while(i-->0)r=r"#";printf "%15s %5d %s %s",$2,$1,r,"\n";}'
}

source "$HOME/.rvm/scripts/rvm"

# from http://www.drbunsen.org/text-triumvirate.html
export EDITOR="vim"
bindkey -v 
bindkey -M viins 'jf' vi-cmd-mode

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  

eval `opam config -env`

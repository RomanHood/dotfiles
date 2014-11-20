# Taken from http://rjpower.org/wordpress/bash-isms-i-wish-i-knew-earlier/
# Should accumulate history file across different terminals.
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"


#--
# MAIN
export EDITOR=vim

# My Aliasez
alias glade='open -a /Applications/Glade.app'
alias lh="clear; ls -larth"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias ls="ls -G"
alias cls="clear; ls"
alias oo='open -a /Applications/OpenOffice.org.app'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias sf="cd ~/Google\ Drive/Work/Clients/Smooth\ Finish/ftp"
alias ll="ls -alh"
alias v='vim .'
alias preview='open -a /Applications/Preview.app'
alias vc='vim ~/.virmc'
alias dot='vim ~/.bash* .vimrc'

# Handy colored tags for scripting
txtrst=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)


if [[ "$TERM" == "xterm" || "$TERM" == "xterm-color" ]]; then
	export PROMPT_COMMAND="set_window_and_tab_title"
	export HISTCONTROL=erasedups
	shopt -s histappend
    #PS1="\w \$ "
    #export PS1
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

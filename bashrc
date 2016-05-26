# Handy colored tags for scripting
txtrst=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
pink=$(tput bold ; tput setaf 5)
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
NO_COLOUR="\[\033[0m\]"

# Taken from Jake: does an ls after cd
function ci() {
  builtin cd ${1:-$HOME} && ls
}

function .m() {
  cd ~/.tmuxinator && vim "$1".yml
}

function gcb() {
  git checkout $(git branch | grep $1)
}

function c_functions() {
  grep -E "^[a-z]+\s+[a-z_A-Z,]+\([a-z \*A-Z_,]+\)" $@ | sort
}

# The following is a function that will allow the user to search
# the files of the current directory for the string that is passed.
function ss() {
  find . | xargs grep "$@" -sl
}

# The following function allows the user to search the command history
# for any commands that contain the the passed string.
function h() {
  history | grep "$@"
}

# Show current git branch in command line
parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_tag () {
  git describe --tags 2> /dev/null
}

parse_git_branch_or_tag() {
  local OUT="$(parse_git_branch)"
  if [ "$OUT" == " ((no branch))" ]; then
    OUT="[$(parse_git_tag)]";
  fi

  echo $OUT
}

function clear_if () {
  local last=$(history | tail -1 | head -1)
  [[ $last == *clear* ]] || printf '\n'
}

shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; clear_if"
export HISTCONTROL=ignoredups:erasedups
export PS1="|$red\$(rvm current)$txtrst| $green\w$pink\$(parse_git_branch_or_tag) $green\n\u$yellow@$cyan\h => "
export GREP_OPTIONS="-i --color=tty"
export GREP_COLOR='07;38;5;74'
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export EDITOR=vim

source "$HOME/dotfiles/aliases"

# Handy colored tags for scripting
txtrst=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
pink=$(tput bold ; tput setaf 5)
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
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

function set_window_and_tab_title() {
  local pwd_length=42 # set the maximum length just incase with dig deep.
  local dir="$PWD"    # get the cwd

  # Substitute a leading path that's in $HOME for "~"
  if [[ "$HOME" == ${dir:0:${#HOME}} ]]; then
    dir="~${dir:${#HOME}}"
  fi
  # Append a trailing slash if it's not there already.
  if [[ ${dir:${#dir}-1} != "/" ]]; then
    dir="$dir/"
  fi
  # Truncate if we're too long.
  # We preserve the leading '/' or '~/', and substitute
  # ellipses for some directories in the middle.
  if [[ "$dir" =~ (~){0,1}/.*(.{${pwd_length}}) ]]; then
    local tilde=${BASH_REMATCH[1]}
    local directory=${BASH_REMATCH[2]}

    # At this point, $directory is the truncated end-section of the
    # path.  We will now make it only contain full directory names
    # (e.g. "ibrary/Mail" -> "/Mail").
    if [[ "$directory" =~ [^/]*(.*) ]]; then
      directory=${BASH_REMATCH[1]}
    fi

    # Can't work out if it's possible to use the Unicode ellipsis,
    # '…' (Unicode 2026).  Directly embedding it in the string does not
    # seem to work, and \u escape sequences ('\u2026') are not expanded.
    #printf -v dir "$tilde/\u2026$s", $directory"
    dir="$tilde/...$directory"
  fi

  # Don't embed $dir directly in printf's first argument, because it's
  # possible it could contain printf escape sequences.
  printf "\033]0;$USER@localhost:%s\007" "$dir"
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

if [[ "$TERM" =~ "xterm" ]]; then
  shopt -s histappend
  export PROMPT_COMMAND="set_window_and_tab_title"
  export HISTCONTROL=erasedups
fi

shopt -s histappend
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -c; history -r; clear_if"
export HISTCONTROL=ignoredups:erasedups
export PS1="|$red\$(rvm current)$txtrst| $green\w$pink\$(parse_git_branch_or_tag) $cyan\n\u => "
export GREP_OPTIONS="-i --color=tty"
export GREP_COLOR='07;38;5;74'
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export EDITOR=vim

# My Aliasez
alias oo='open -a /Applications/OpenOffice.org.app'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gc='git checkout'
alias gf='git fetch'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias glade='open -a /Applications/Glade.app'
alias prev='open -a /Applications/Preview.app'
alias lh="clear; ls -larth"
alias v='vim .'
alias dot='vim ~/.*'
alias vu='vagrant up'
alias vsh='vagrant ssh'
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxinator="TERM=screen-256color-bce tmuxinator"
alias mux="TERM=screen-256color-bce mux"
alias tl="tmux list-sessions"
alias ts="mux start"
alias panes='tmux list-windows'
alias tk="tmux kill-session -t"
alias ta="tmux attach -t"
alias tlw="tmux list-windows"
alias ms="mux start"
alias doc="docker-compose"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias ls="ls -G"
alias cls="clear; ls"
alias ll="ls -alh"

PATH=$PATH:$HOME/.rvm/bin
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7.0_79)

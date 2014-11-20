export HISTCONTROL=ignoreduops:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

# Taken from Jake: does an ls after cd
function ci() {
    builtin cd ${1:-$HOME} && ls
}

function c_functions() {
  grep -E "^[a-z]+\s+[a-z_A-Z,]+\([a-z \*A-Z_,]+\)" $@ | sort
}


# The following is a function that will allow the user to search
# the files of the current directory for the string that is passed.
function ss() {
	find . | xargs grep "$@" -sl
}

function show_env () {
    echo -n $cyan
    echo "+-------------------------------------------------------"
    echo "| rvm: $(rvm current)"
    echo "+-------------------------------------------------------"
    echo -n $txtrst
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

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u$NO_COLOUR:\w$YELLOW\$(parse_git_branch_or_tag)$NO_COLOUR\$ "
export PS1

[[ -f "/etc/bashrc" ]] && source "/etc/bashrc"
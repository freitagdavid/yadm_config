# SYNOPSIS
#   reMatch string regex
# DESCRIPTION
#   Multi-shell implementation of the =~ regex-matching operator;
#   works in: bash, ksh, zsh
#
#   Matches STRING against REGEX and returns exit code 0 if they match.
#   Additionally, the matched string(s) is returned in array variable ${reMatch[@]},
#   which works the same as bash's ${BASH_REMATCH[@]} variable: the overall
#   match is stored in the 1st element of ${reMatch[@]}, with matches for
#   capture groups (parenthesized subexpressions), if any, stored in the remaining
#   array elements.
#   NOTE: zsh arrays by default start with index *1*.
# EXAMPLE:
#   reMatch 'This AND that.' '^(.+) AND (.+)\.' # -> ${reMatch[@]} == ('This AND that.', 'This', 'that')
function reMatch {
  typeset ec
  unset -v reMatch # initialize output variable
  [[ $1 =~ $2 ]] # perform the regex test
  ec=$? # save exit code
  if [[ $ec -eq 0 ]]; then # copy result to output variable
    [[ -n $BASH_VERSION ]] && reMatch=( "${BASH_REMATCH[@]}" )
    [[ -n $KSH_VERSION ]]  && reMatch=( "${.sh.match[@]}" )
    [[ -n $ZSH_VERSION ]]  && reMatch=( "$MATCH" "${match[@]}" )
  fi
  return $ec
}

function addNpm {
  npm config set -- "//gitlab.com/api/v4/projects/${1}/packages/npm/:_authToken" "${GITLAB_AUTH}"
}

function ycp {
  if [ -z "$1" ]
    then
      echo "No argument supplies"
      exit
    else
      yadm commit -a -m "'$1'"
      yadm push
  fi
}
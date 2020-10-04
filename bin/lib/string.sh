#!/bin/sh

stringContains() {
  [ -z "$1" ] || {
    [ -z "${2##*$1*}" ] && [ -n "$2" ];
  };
}

removeWord() (
  set -f
  IFS=' '

  w=$2

  set -- $1
  for arg do
    shift
    [ "$arg" = "$w" ] && continue
    set -- "$@" "$arg"
  done

  printf '%s\n' "$*"
)

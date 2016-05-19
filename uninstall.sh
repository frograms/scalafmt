#!/bin/bash

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unlink_file () {
  local src=$1 dst=$2
  local current="$(readlink $dst)"

  if [ "$current" == "$src" ]
  then
    rm $dst
    echo "$dst removed"
  fi
}

unlink () {
  unlink_file "$BASE_DIR/bin/$1" "/usr/local/bin/$1"
}

unlink 'scalafmt'
unlink 'scalafmt-added'
unlink 'scalafmt-verify'

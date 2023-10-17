#!/usr/bin/env bash

SOURCE="${BASH_SOURCE}"
BASEDIR=$(dirname $0)

while read p; do
  code --install-extension $p >/dev/null 2>/dev/null
  if [[ $? != 0 ]] ; then
    echo "💥 $(echo $p | cut -d '.' -f 2)"
  else
    echo "✔ $(echo $p | cut -d '.' -f 2)"
  fi
  wait
done < $BASEDIR/extensions.txt

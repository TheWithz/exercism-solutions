#!/bin/bash
main() {
  (( $# == 1 )) || usage
  TRACK="$1"
  curl -LSs "https://exercism.io/tracks/$TRACK/exercises" |
    grep "/tracks/$TRACK/exercises/" |
    awk '{print $3}' |
    cut -d'/' -f'5' |
    cut -d'"' -f'1' |
    xargs -I{} sh -c "exercism download --exercise={} --track=$TRACK || echo '{}'"
}

usage() {
  echo "Usage: exercism-download.sh <Track>" 
  exit 1
}

main "$@"

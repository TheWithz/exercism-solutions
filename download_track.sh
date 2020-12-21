#!/bin/bash
main() {
    (( "$#" != 1 )) && usage && exit
    TRACK="$1"
    FILE="$(mktemp)"
    curl -LS https://exercism.io/tracks/$TRACK/exercises | grep "/tracks/$TRACK/exercises/" | awk '{print $3}' | cut -d/ -f5 | cut -d\" -f1 > $FILE
    for word in `sed '/^$/d' $FILE`; do exercism download --exercise="$word" --track=$TRACK; done
}

usage() {
   echo "Usage: exercism-download.sh <Track>" 
}

main "$@"

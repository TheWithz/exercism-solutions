#!/usr/bin/env bash

main () {
    # if there are more or less than 2 arguments, error
    (( $# != 2 )) && error 1
    # both arguments must be the same length
    (( ${#1} != ${#2} )) && error 2
    count=0
    for ((i=0; i<${#1}; i++)); do 
        [[ "${1:i:1}" != "${2:i:1}" ]] && (( ++count ))
    done
    echo "$count"
}

error() {
    (( $1 == 1 )) && echo "Usage: hamming.sh <string1> <string2>"
    (( $1 == 2 )) && echo "left and right strands must be of equal length"
    exit 1
}

main "$@"

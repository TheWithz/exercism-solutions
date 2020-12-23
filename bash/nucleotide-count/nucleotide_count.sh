#!/usr/bin/env bash

main () {
    (( "$#" != 1 )) && usage 1
    [[ ! "$1" =~ ^[ACGT]*$ ]] && usage 2
    echo "$(echo "ACGT$1" | grep -o . | sort | uniq -c | awk '{print $2": "$1-1}')"
}

usage() {
    (( $1 == 1 )) && echo "bash nucleotides.sh <string>"
    (( $1 == 2 )) && echo "Invalid nucleotide in strand" >&2
    exit 1
}

main "$@"

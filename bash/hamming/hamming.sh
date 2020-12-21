#!/usr/bin/env bash

main () {
    # if there are more or less than 2 arguments, error
    (( $# != 2 )) && error 1
    # both arguments must be the same length
    (( ${#1} != ${#2} )) && error 2
    count=0
    # turns the dna strings into arrays for easier for looping
    # grep -o . prints each character on a newline
    # paste -s -d ' ' replaces all but the last newline with a space
    # using paste is equivalent to: tr '\n' ' ' | sed '$s/ $/\n/'
    arr1=(`echo "$1" | grep -o . | paste -s -d ' '`)
    arr2=(`echo "$2" | grep -o . | paste -s -d ' '`)
    # loop through the strings by index
    for i in "${!arr1[@]}"; do
        [[ "${arr1[$i]}" != "${arr2[$i]}" ]] && (( ++count ))
    done
    echo "$count"
}

error() {
    (( $1 == 1 )) && echo "Usage: hamming.sh <string1> <string2>"
    (( $1 == 2 )) && echo "left and right strands must be of equal length"
    exit 1
}

main "$@"

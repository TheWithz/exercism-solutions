#!/usr/bin/env bash

main () {
    # separates input, one word per line
    tr -s " -" "\n" <<< "$1" |
    # removes all special characters and numbers, but not newlines
    tr -cd '[:alpha:]\n' |
    # changes all letter to uppercase
    tr [:lower:] [:upper:] |
    # grab the first letter of each word
    cut -c 1 |
    # stick them back together
    paste -s -d ''
}

main "$@"

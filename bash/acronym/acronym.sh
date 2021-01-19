#!/usr/bin/env bash

main () {
    # separates input, one word per line
    tr -s " -" "\n" <<< "$1" |
    # removes everything but not letters or newlines
    tr -cd '[:alpha:]\n' |
    # changes all letters to uppercase
    tr [:lower:] [:upper:] |
    # grab the first letter of each word
    cut -c 1 |
    # stitch them back together
    paste -s -d ''
}

main "$@"

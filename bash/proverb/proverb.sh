#!/usr/bin/env bash

main () {
    # no input yields empty output
    test $# -eq 0 && usage
    # create the array using quotes around $@ to catch globbing
    declare -a words=( "$@" )
    # array length minus one
    len=$(expr ${#words[@]} - 1)
    # from one to $len
    for i in $(seq 1 $len); do
        j=$(expr $i - 1)
        echo "For want of a ${words[$j]} the ${words[$i]} was lost."
    done
    echo "And all for the want of a ${words[0]}."
}

usage () {
    echo ""
    exit 0
}

main "$@"

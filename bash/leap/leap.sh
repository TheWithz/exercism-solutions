#!/usr/bin/env bash

main () {
    test $# -eq 1 || usage
    year=$1
    # if year is not divisible by 4, false
    if (( $year % 4 )); then
        echo "false"
        exit 2
    fi
    # if year is divisible by 100 but not 400, false
    if ! (( $year % 100 )); then
        if (( $year % 400 )); then
            echo "false"
            exit 2
        fi
    fi
    echo "true"
}

usage () {
    echo "Wrong number of arguments"
    exit 1
}

main "$@"

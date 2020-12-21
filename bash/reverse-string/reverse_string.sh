#!/usr/bin/env bash

main () {
    test $# -eq 1 || usage
    rev <<< $1
}

usage () {
    echo "Wrong number of arguments"
    exit 1
}

main "$@"

#!/usr/bin/env bash

main () {
    # test $# -eq 1 || usage
    (( $# == 1 )) || usage
    echo "Hello, $1"
}

usage () {
    echo "Usage: ./error_handling.sh <greetee>"
    exit 1
}

main "$@"

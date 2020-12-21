#!/usr/bin/env bash

main () {
    # if the input contains not a number, exit
    [[ $1 =~ [^0-9] ]] && echo "$1 is not a valid number" && exit 1
    output=
    # if 3 is a factor, concatenate Pling
    (( $1 % 3 == 0 )) && output+="Pling"
    # if 5 is a factor, concatenate Plang
    (( $1 % 5 == 0 )) && output+="Plang"
    # if 7 is a factor, concatenate Plong
    (( $1 % 7 == 0 )) && output+="Plong"
    # if output is empty, echo the original, otherwise, output the string
    echo ${output:-$1}
}

main "$@"

#!/usr/bin/env bash

main () {
    (( $# == 0 )) && error "invalid args: no args"
    (( $# == 1 )) && error "invalid args: only 1 arg"
    # matches floating point values
    re="^[-]?[0-9]+([.][0-9]+)?$"
    [[ ! "$1" =~ $re ]] && error "invalid args: first arg non-numeric"
    [[ ! "$2" =~ $re ]] && error "invalid args: second arg non-numeric"
    dist=$(bc -l <<< "var1 = $1; var2 = $2; sqrt(var1^2 + var2^2)")
    score=$(bc << EOF
    var1 = $dist;
    if (var1 <= 1) 10 else {
        if (var1 <= 5) 5 else {
            if (var1 <= 10) 1 else 0
        }
    }
EOF
)
    echo "$score"
}

error () {
    echo "$1"
    exit 1
}

main "$@"

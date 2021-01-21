#!/usr/bin/env bash

main () {
    [[ "$1" == "encode" ]] && en "$2"
    [[ "$1" == "decode" ]] && de "$2"
    exit 0
}

en () {
    # put each character in a new line
    grep -o '.' <<< "$1" |
        # count the runs
        uniq -c |
        # remove the space in between
        awk '{print $1$2}' |
        # replace newlines with spaces
        tr -s '\n' ' ' |
        # remove the special case of a single space in between letters
        # remove all 1s but not 11s in front of letters
        # remove leftover spaces
        sed -re 's/ 1 /  /g' \
        -re 's/([[:space:]]*)1([[:alpha:]])/\1\2/g' \
        -re 's/([[:alpha:]])[[:space:]]/\1/g'
}

# decode solution stolen from glennj
de () {
    local phrase=$1

    while [[ $phrase =~ ([[:digit:]]+)([^[:digit:]]) ]]; do
        printf -v phrase "%s%s%s" \
            "${phrase%%${BASH_REMATCH[0]}*}" \
            "$(str::repeat "${BASH_REMATCH[2]}" "${BASH_REMATCH[1]}")" \
            "${phrase#*${BASH_REMATCH[0]}}"
    done
    echo "$phrase"
}

# Repeat a character a specified number of times
#
# parameters
# - character
# - count
#
# usage: strRepeat "*" 60
#
str::repeat() {
    local char=$1 count=$2
    local result
    # string of count spaces
    printf -v result "%*s" "$count" ""
    # replace spaces with the char
    echo "${result// /$char}"
}

main "$@"

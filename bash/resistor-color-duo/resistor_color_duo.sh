#!/usr/bin/env bash

# define color constants
black=0
brown=1
red=2
orange=3
yellow=4
green=5
blue=6
violet=7
grey=8
white=9

main () {
    test $# -eq 2 || usage 1
    local output=""
    get_color_code $1
    get_color_code $2
    echo "$output"
}

usage () {
    case "$1" in
        1) echo "Wrong number of arguments" ;;
        2) echo "Color does not exist" ;;
    esac
    exit 1
}

get_color_code () {
    # switch on color input, appending numeric value to output
    case "$1" in
        black) output=$output$black ;;
        brown) output=$output$brown ;;
        red) output=$output$red ;;
        orange) output=$output$orange ;;
        yellow) output=$output$yellow ;;
        green) output=$output$green ;;
        blue) output=$output$blue ;;
        violet) output=$output$violet ;;
        grey) output=$output$grey ;;
        white) output=$output$white ;;
        # any colors we don't cover is an error
        *) usage 2
    esac
}

main "$@"

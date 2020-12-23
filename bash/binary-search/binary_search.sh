#!/usr/bin/env bash

main () {
    arr=("${@:2}")
    left=0
    (( right = ${#arr[@]}-1 ))
    while (( left <= right )); do
        (( mid = (left+right)/2 ))
        (( "$1" == "${arr[$mid]}" )) && echo "$mid" && exit
        (( "$1" > "${arr[$mid]}" )) && (( left = mid+1 ))
        (( "$1" < "${arr[$mid]}" )) && (( right = mid-1 ))
    done
    echo "-1"
}

main "$@"

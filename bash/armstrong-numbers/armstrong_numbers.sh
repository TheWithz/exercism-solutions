#!/usr/bin/env bash

main () {
    num="$1"
    len="${#num}"
    bc <<EOF
    temp = $num;
    ans = 0;
    while ( temp >= 10 ) {
        ans += ( temp % 10 )^$len;
        temp /= 10;
    }
    ans += temp^$len;
    if ( ans == $num ) "true" else "false"
EOF
}

main "$@"

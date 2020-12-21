#!/usr/bin/env bash

# associative array for checking matches
declare -A parens=( [\[]=\] [\(]=\) [{]=} )

main () {
    stack=""
    # iterate character-wise through the input
    for (( i=0; i<${#1}; i++ )); do
        char="${1:$i:1}"
        # ignoring all input that is not a bracket
        case $char in
            # if char is a left bracket
            "(" | "[" | "{")
                # push the character onto the stack
                stack=$char$stack
            ;;
            # if char is a right bracket
            ")" | "]" | "}")
                # peek the top of the stack if it's not empty
                # if char matches the peeked element
                if [[ ${#stack} -ne 0 && ${parens["${stack:0:1}"]} == $char ]]; then
                    # pop off the top element from the stack and continue
                    stack=${stack:1}
                    # if they don't match, echo false and exit
                else
                    echo "false"
                    exit 0
                fi
            ;;
        esac
    done

    # if the stack is empty
    [[ -z $stack ]] && echo "true" || echo "false"
}

main "$@"

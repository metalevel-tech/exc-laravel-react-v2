#!/bin/bash

# File: tree-md
# Source: https://stackoverflow.com/a/35889620/6543935

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 | grep -v 'node_modules\|build' |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g' | tail -n +2)

printf "# Directory tree tree\n\n${tree}\n"
#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
  src=$(dirname "${(%):-%N}")/listbox/listbox.sh
elif [ -n "$BASH_VERSION" ]; then
  src=$(dirname "${BASH_SOURCE[0]}")/listbox/listbox.sh
else
  src=$(dirname "$0")/listbox/listbox.sh
fi

source "$src"

get-list() {
  cat ~/.tunnels | grep -E "^ssh\s" | sed -e 's/\s*$//'
}

tunnel() {
    hist=$(get-list | tr '\n' '|')
    res=$(listbox -t "Select tunnel:" -o "$hist" | tee /dev/tty | tail -n 1)
    echo ""
    eval "$res"
}
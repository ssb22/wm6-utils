#!/bin/bash

# Recover most text from .PWI notes files
# generated by some versions of Windows Mobile

# Silas S. Brown 2018 - public domain - no warranty

for N in *.pwi ; do
    export T="$(echo "$N"|sed -e s/\.[^.]*$/.txt/)"
    if test -e "$T"; then
        echo "$T exists, not changing"
    else
        strings "$N" | grep -v "^..pwi$" > "$T" &&
        touch -r "$N" "$T"
    fi
done

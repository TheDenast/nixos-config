#!/usr/bin/env bash
state="${TMPDIR:-/tmp}/kitty-zen-$KITTY_PID"
if [ -e "$state" ]; then
    kitten @ set-spacing margin-left=default margin-right=default
    rm -f "$state"
else
    kitten @ set-spacing margin-left=600 margin-right=600
    : > "$state"
fi


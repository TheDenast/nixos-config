#!/usr/bin/env bash

STATE_FILE="/tmp/fan_state"

if [ -f "$STATE_FILE" ]; then
    sudo ectool autofanctrl
    rm "$STATE_FILE"
else
    sudo ectool fanduty 100
    touch "$STATE_FILE"
fi

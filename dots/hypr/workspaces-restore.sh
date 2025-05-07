#!/usr/bin/env bash

for i in {1..10}; do
    hyprctl dispatch moveworkspacetomonitor $i DP-11
    echo "Moved workspace $i to monitor DP-11"
done

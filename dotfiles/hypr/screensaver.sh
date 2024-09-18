#!/usr/bin/env bash

# Check if any screensaver processes are running
if pgrep -f 'kitty --class cmatrix_screensaver' >/dev/null; then
  # If screensaver is running, kill all matching kitty processes
  pkill -f 'kitty --class cmatrix_screensaver'
else
  # If screensaver is not running, start it on all monitors

  # Get the list of connected monitor names
  monitors=$(hyprctl monitors -j | jq -r '.[].name')

  # Loop through each monitor and launch the screensaver
  for monitor in $monitors; do
    hyprctl dispatch exec "[monitor $monitor; fullscreen; opacity 0.8 override; animation popin 50%] \
        kitty --class cmatrix_screensaver -e sh -c 'sleep 0.5 && cmatrix -C blue -u 9 -b'"
  done
fi

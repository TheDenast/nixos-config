#!/usr/bin/env bash

# Path to wallpaper collection
WALLPAPER_DIR="/home/denast/Pictures/wallpaper-collection/dracula/"

# Get all connected monitors
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

# Sleep to ensure Hyprland is fully loaded
sleep 1

# Set random wallpaper for each monitor
for MONITOR in $MONITORS; do
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    swww img "$RANDOM_WALLPAPER" --transition-type center -o "$MONITOR"
    # Small delay between setting wallpapers to avoid potential issues
    sleep 0.5
done

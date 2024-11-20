#!/usr/bin/env bash

get_monitor_name() {
  hyprctl monitors -j | jq -r '.[] | select((.model | type == "string" and contains($search)) or (.description | type == "string" and contains($search))) | .name' --arg search "$1"
}

# Get monitor names based on partial matches
hp_monitor=$(get_monitor_name "HP")
dell_monitor=$(get_monitor_name "DELL")
laptop_monitor=$(get_monitor_name "BOE")

# Check if we're at work (both monitors present)
if [[ -n "$hp_monitor" && -n "$dell_monitor" ]]; then
  echo "at work"
  hyprctl keyword monitor "${dell_monitor},1920x1080@60,0x0,1"
  hyprctl keyword monitor "${hp_monitor},1600x900@60,1920x0,1,transform,3"
  hyprctl keyword monitor "${laptop_monitor},2880x1920@120,0x1080,2"
else
  echo "standalone"
  hyprctl keyword monitor "${laptop_monitor},2880x1920@120,0x0,2"
fi

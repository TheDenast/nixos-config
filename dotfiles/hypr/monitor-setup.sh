#!/usr/bin/env bash

# Function to get monitor information
get_monitor_info() {
  hyprctl monitors -j | jq -r '.[] | select(.name == "'$1'")'
}

# Function to apply monitor configuration
apply_monitor_config() {
  local dp3_info=$(get_monitor_info "DP-3")
  local edp1_info=$(get_monitor_info "eDP-1")

  # Home setup (DP-3 connected at 2560x1440)
  if [[ -n "$dp3_info" ]] && [[ "$dp3_info" == *'"width": 2560'* && "$dp3_info" == *'"height": 1440'* ]]; then
    echo "at home"
    hyprctl keyword monitor "DP-3,2560x1440@143.99899,1440x0,1"
    hyprctl keyword monitor "eDP-1,disable"
  # Work setup (assuming DP-3 at 1920x1080, adjust if different)
  elif [[ -n "$dp3_info" ]] && [[ "$dp3_info" == *'"width": 1920'* && "$dp3_info" == *'"height": 1080'* ]]; then
    echo "at work"
    hyprctl keyword monitor "DP-3,1920x1080@60,0x0,1"
    hyprctl keyword monitor "eDP-1,2880x1920@120,0x1080,2"
    # hyprctl keyword monitor "eDP-1,2880x1920@120,0x0,2"
    # hyprctl keyword monitor "DP-3,1920x1080@60,2880x0,1,transform,1"
  # Laptop-only setup
  else
    echo "standalone"
    hyprctl keyword monitor "eDP-1,2880x1920@120,0x0,2"
  fi
}

# Apply the configuration
apply_monitor_config

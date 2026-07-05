#!/usr/bin/env bash

get_monitor_name() {
  hyprctl monitors -j | jq -r '.[] | select((.model | type == "string" and contains($search)) or (.description | type == "string" and contains($search))) | .name' --arg search "$1"
}
dell_monitor=$(get_monitor_name "Xiaomi")

for i in {1..10}; do
    hyprctl dispatch moveworkspacetomonitor $i $dell_monitor
    echo "Moved workspace $i to monitor  $dell_monitor"
done

#!/usr/bin/env bash

# XWayland apps (games, launchers, ...) take their default resolution and placement from the
# X11 "primary" output, which Hyprland never sets, so they end up sized to the laptop screen.
# Mark the first external monitor as primary, and redo it on hotplug since Xwayland drops the
# flag whenever that output disappears.

set_primary() {
  local name
  # skip the laptop panel and virtual outputs (headless ones are made for screen sharing)
  name=$(hyprctl monitors -j | jq -r '[.[] | select(.name | test("^(eDP|HEADLESS|FALLBACK)") | not)][0].name // empty')
  [[ -z "$name" ]] && return

  # Xwayland learns about a new output slightly after Hyprland does, so wait for it to show up
  for _ in {1..20}; do
    if xrandr --query | grep -q "^$name connected"; then
      xrandr --output "$name" --primary
      echo "XWayland primary set to $name"
      return
    fi
    sleep 0.5
  done
}

set_primary

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
  while read -r event; do
    case "$event" in
      monitoradded\>\>*) set_primary ;;
    esac
  done

#!/usr/bin/env bash

# This small script basically optimizes a
# "tailscale + mullvad-vpn + mullvad-browser" routine.
# Connects to a suggested mullvad exit node w/ tailscale, 
# opens mullvad-browser, disconnects from exit node on browser exit

# Function to disconnect from exit node
disconnect_exit_node() {
    echo "Disconnecting from exit node..."
    sudo tailscale set --exit-node=""
    exit $1
}

# Set up trap to ensure we disconnect on script termination
trap 'disconnect_exit_node 1' INT TERM

# Run the suggest command and capture the output
suggestion=$(tailscale exit-node suggest)

# Extract the suggested exit node
exit_node=$(echo "$suggestion" | awk -F': ' '/Suggested exit node:/ {gsub(/\.$/, "", $2); print $2}')

# Check if we successfully extracted an exit node
if [ -z "$exit_node" ]; then
    echo "Failed to get a suggested exit node."
    exit 1
fi

# Connect to the suggested exit node
echo "Connecting to exit node: $exit_node"
sudo tailscale set --exit-node="$exit_node"

# Check if connection was successful
if [ $? -ne 0 ]; then
    echo "Failed to connect to the exit node."
    exit 1
fi

# Check if Mullvad browser is installed
if ! command -v mullvad-browser >/dev/null 2>&1; then
    echo "Mullvad browser not found. Please make sure it's installed and in your PATH."
    disconnect_exit_node 1
fi

# Open Mullvad browser
echo "Opening Mullvad browser..."
mullvad-browser &
browser_pid=$!

# Wait for the browser to exit
wait $browser_pid

# Disconnect from exit node
disconnect_exit_node 0

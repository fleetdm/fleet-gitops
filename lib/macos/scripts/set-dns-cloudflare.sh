#!/bin/bash

# Script to set DNS to 1.1.1.1 on macOS

# Function to set DNS for a network service
set_dns() {
    local service=$1
    echo "Setting DNS for $service..."
    
    # Set DNS servers to 1.1.1.1 and 1.0.0.1 (primary and secondary)
    sudo networksetup -setdnsservers "$service" 1.1.1.1 1.0.0.1
    
    # Show the current DNS settings
    echo "DNS servers for $service:"
    networksetup -getdnsservers "$service"
    echo ""
}

# Get all network services
services=$(networksetup -listallnetworkservices | tail -n +2)

# Set DNS for each active network service
while IFS= read -r service; do
    # Skip services with asterisk (disabled)
    if [[ $service != *"*"* ]]; then
        set_dns "$service"
    fi
done <<< "$services"

echo "DNS configuration complete!"
echo ""
echo "To verify your DNS settings:"
echo "1. System Preferences > Network > Advanced > DNS"
echo "2. Or run: scutil --dns"
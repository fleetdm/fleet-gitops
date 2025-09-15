#!/bin/sh

IDENTIFIER_FILE="/opt/orbit/identifier"
FLEET_URL="https://jwatts.ngrok.dev"

if [ -f "$IDENTIFIER_FILE" ]; then
    IDENTIFIER=$(cat "$IDENTIFIER_FILE")
    echo "$FLEET_URL/device/$IDENTIFIER"
else
    echo "Identifier file not found at $IDENTIFIER_FILE"
fi
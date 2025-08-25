#!/bin/bash
# Replace with your actual MacBook Pro serial number
ALLOWED_SERIAL="NQHFVQ2JF4"

SERIAL=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}')

echo "Detected serial: $SERIAL"

if [[ "$SERIAL" == "$ALLOWED_SERIAL" ]]; then
  echo "✅ Success: This device is authorized"
  exit 0
else
  echo "❌ Failure: Unauthorized device"
  exit 1
fi

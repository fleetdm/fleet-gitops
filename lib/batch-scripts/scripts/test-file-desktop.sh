#!/bin/bash
# Creates a text file on the Desktop with some content

DESKTOP="$HOME/Desktop"
FILE="$DESKTOP/FleetTestFile.txt"

echo "Hello from Fleet QA script!" > "$FILE"

echo "File created at: $FILE"

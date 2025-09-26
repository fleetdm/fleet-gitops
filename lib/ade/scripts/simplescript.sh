#!/bin/bash

# Set the directory and file name
DIR_NAME="/Users/Shared/PezHub"
FILE_NAME="candy.txt"

# Create the directory
mkdir -p "$DIR_NAME"

# Create a text file with some content inside the directory
echo "This is a sample text file, although i wish it was candy" > "$DIR_NAME/$FILE_NAME"

# Confirmation message
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully."

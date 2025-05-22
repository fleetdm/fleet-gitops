#!/bin/bash

# Platforms and architectures
platforms=("macos" "windows" "linux")
architectures=("arm" "x86")
apps=("1password" "zoom")

# For each platform, architecture, and app, create the directory structure
for platform in "${platforms[@]}"; do
  for arch in "${architectures[@]}"; do
    for app in "${apps[@]}"; do
      base="software/$platform/$arch/$app"
      mkdir -p "$base/scripts"
      mkdir -p "$base/queries"
      # Create placeholder config file
      touch "$base/$app.yml"
      # Create example script and query files
      touch "$base/scripts/install-script.sh"
      touch "$base/scripts/uninstall-script.sh"
      touch "$base/queries/pre-install-query.yml"
      # Additional example files for macos/arm/zoom
      if [[ "$platform" == "macos" && "$arch" == "arm" && "$app" == "zoom" ]]; then
        touch "$base/scripts/install-script.sh"
        touch "$base/scripts/uninstall-script.sh"
        touch "$base/queries/pre-install-query.yml"
        touch "$base/queries/post-install-script.sh"
      fi
      # Use .ps1 for Windows scripts
      if [[ "$platform" == "windows" ]]; then
        mv "$base/scripts/install-script.sh" "$base/scripts/install-script.ps1"
        mv "$base/scripts/uninstall-script.sh" "$base/scripts/uninstall-script.ps1"
        mv "$base/scripts/post-install-script.sh" "$base/scripts/uninstall-script.ps1"
      fi
    done
  done
done

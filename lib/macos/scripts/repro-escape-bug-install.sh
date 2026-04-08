#!/bin/bash
# Minimal repro for Fleet GitOps backslash-escape stripping bug.
#
# GitOps validation requires "$" to be escaped as "\$" so that Fleet does
# not try to resolve "$VAR" as a repo-level environment variable at
# validation time. The expectation is that Fleet strips the leading
# backslash before delivering the script to the endpoint, so the host
# receives a normal bash script containing "$EUID", "$USER", etc.
#
# If the delivered install script (visible in Fleet UI > Software >
# this package > Advanced options > Install script) still contains
# "\$EUID" / "\$USER" / "\$HOME" / "\$CURRENT_USER", the unescape step
# is missing between GitOps ingestion and script delivery, and bash on
# the target host will emit errors such as:
#   line N: \$EUID: command not found
#
# Target: macOS workstation (self-service install).

set -eu

CURRENT_USER=$(/usr/bin/stat -f%Su /dev/console)

echo "repro: EUID=\$EUID USER=\$USER HOME=\$HOME CURRENT_USER=\$CURRENT_USER"

if [ "\$EUID" -ne 0 ]; then
  echo "repro: not running as root (EUID=\$EUID)" >&2
  exit 1
fi

echo "repro: invoking user is \$USER, console user is \$CURRENT_USER, home is \$HOME"
exit 0

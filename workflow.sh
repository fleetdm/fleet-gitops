#!/usr/bin/env bash

# -e: Immediately exit if any command has a non-zero exit status.
# -x: Print all executed commands to the terminal.
# -u: Exit if an undefined variable is used.
# -o pipefail: Exit if any command in a pipeline fails.
set -exuo pipefail

GLOBAL_FILE=./default.yml
FLEETCTL="${FLEETCTL:-fleetctl}"

# Validate that global file contains org_settings
grep -Exq "^org_settings:.*" $GLOBAL_FILE

if compgen -G ./teams/*.yml > /dev/null; then
  # Validate that every team has a unique name.
  # This is a limited check that assumes all team files contain the phrase: `name: <team_name>`
  ! perl -nle 'print $1 if /^name:\s*(.+)$/' ./teams/*.yml | sort | uniq -d | grep . -cq
fi

# Dry run
$FLEETCTL gitops -f $GLOBAL_FILE --dry-run
for team_file in ./teams/*.yml; do
  $FLEETCTL gitops -f "$team_file" --dry-run
done

# Real run
$FLEETCTL gitops -f $GLOBAL_FILE
for team_file in ./teams/*.yml; do
  $FLEETCTL gitops -f "$team_file"
done

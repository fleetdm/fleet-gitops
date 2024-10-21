#!/usr/bin/env bash

# -e: Immediately exit if any command has a non-zero exit status.
# -x: Print all executed commands to the terminal.
# -u: Exit if an undefined variable is used.
# -o pipefail: Exit if any command in a pipeline fails.
set -exuo pipefail

FLEET_GITOPS_DIR="${FLEET_GITOPS_DIR:-.}"
FLEET_GLOBAL_FILE="${FLEET_GLOBAL_FILE:-$FLEET_GITOPS_DIR/default.yml}"
FLEETCTL="${FLEETCTL:-fleetctl}"
FLEET_DRY_RUN_ONLY="${FLEET_DRY_RUN_ONLY:-false}"
FLEET_DELETE_OTHER_TEAMS="${FLEET_DELETE_OTHER_TEAMS:-true}"

# Validate that global file contains org_settings
grep -Exq "^org_settings:.*" "$FLEET_GLOBAL_FILE"

if compgen -G "$FLEET_GITOPS_DIR"/teams/*.yml > /dev/null; then
  # Validate that every team has a unique name.
  # This is a limited check that assumes all team files contain the phrase: `name: <team_name>`
  ! perl -nle 'print $1 if /^name:\s*(.+)$/' "$FLEET_GITOPS_DIR"/teams/*.yml | sort | uniq -d | grep . -cq
fi

args=(-f "$FLEET_GLOBAL_FILE")
for team_file in "$FLEET_GITOPS_DIR"/teams/*.yml; do
  if [ -f "$team_file" ]; then
    args+=(-f "$team_file")
  fi
done
if [ "$FLEET_DELETE_OTHER_TEAMS" = true ]; then
  args+=(--delete-other-teams)
fi

# Dry run
$FLEETCTL gitops "${args[@]}" --dry-run
if [ "$FLEET_DRY_RUN_ONLY" = true ]; then
  exit 0
fi

# Real run
$FLEETCTL gitops "${args[@]}"

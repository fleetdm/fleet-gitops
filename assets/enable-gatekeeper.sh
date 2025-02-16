#!/bin/sh

# Enable Gatekeeper
spctl --master-enable

# Verify status
spctl --status
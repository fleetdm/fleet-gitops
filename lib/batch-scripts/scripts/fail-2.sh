#!/bin/bash
# This will fail because writing directly to /etc requires root
echo "Fleet QA test" > /etc/fleet_test.txt

#!/bin/bash
# run-all.sh - Run all E2E test scenarios

set -uo pipefail

SCRIPT_DIR="$(dirname "$0")"
source "${SCRIPT_DIR}/common.sh"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}PinchTab E2E Test Suite${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PINCHTAB_URL: ${PINCHTAB_URL}"
echo "FIXTURES_URL: ${FIXTURES_URL}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Waiting for instances to become ready..."
wait_for_instance_ready "${PINCHTAB_URL}"
wait_for_instance_ready "${PINCHTAB_SECURE_URL}"
echo ""

# Tests in run-recent.sh are excluded here to avoid running them twice.
RECENT_ONLY="41-extensions.sh|42-lite-engine.sh"

for script in "${SCRIPT_DIR}"/[0-9][0-9]-*.sh; do
  name="$(basename "$script")"
  if echo "$name" | grep -qE "^($RECENT_ONLY)$"; then
    continue
  fi
  if [ -f "$script" ]; then
    echo -e "${YELLOW}Running: ${name}${NC}"
    echo ""
    source "$script"
    echo ""
  fi
done

print_summary

# Save results if results dir exists
if [ -d "${RESULTS_DIR:-}" ]; then
  echo "passed=$TESTS_PASSED" > "${RESULTS_DIR}/summary.txt"
  echo "failed=$TESTS_FAILED" >> "${RESULTS_DIR}/summary.txt"
  echo "timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "${RESULTS_DIR}/summary.txt"
fi

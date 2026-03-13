#!/bin/bash
# 33-daemon.sh — CLI daemon command

source "$(dirname "$0")/common.sh"

# ─────────────────────────────────────────────────────────────────
start_test "pinchtab daemon (non-interactive shows status)"

# Non-interactive mode should print status and exit 0
pt daemon
EXIT_CODE=$PT_CODE
if [ $EXIT_CODE -eq 0 ]; then
  echo -e "  ${GREEN}✓${NC} daemon status displayed (exit 0)"
  ((ASSERTIONS_PASSED++)) || true
else
  echo -e "  ${RED}✗${NC} daemon exited with code $EXIT_CODE"
  ((ASSERTIONS_FAILED++)) || true
fi

end_test

# ─────────────────────────────────────────────────────────────────
start_test "pinchtab daemon install (fails without systemd)"

# Alpine doesn't have systemd, so install should fail gracefully
pt daemon install
EXIT_CODE=$PT_CODE
if [ $EXIT_CODE -ne 0 ]; then
  echo -e "  ${GREEN}✓${NC} daemon install fails gracefully without systemd (exit $EXIT_CODE)"
  ((ASSERTIONS_PASSED++)) || true
else
  echo -e "  ${RED}✗${NC} daemon install unexpectedly succeeded"
  ((ASSERTIONS_FAILED++)) || true
fi

end_test

# ─────────────────────────────────────────────────────────────────
start_test "pinchtab daemon unknown-subcommand → exit 2"

pt daemon bogus-command
EXIT_CODE=$PT_CODE
if [ $EXIT_CODE -eq 2 ]; then
  echo -e "  ${GREEN}✓${NC} unknown subcommand exits with code 2"
  ((ASSERTIONS_PASSED++)) || true
else
  echo -e "  ${RED}✗${NC} expected exit 2, got $EXIT_CODE"
  ((ASSERTIONS_FAILED++)) || true
fi

end_test

# ─────────────────────────────────────────────────────────────────
start_test "pinchtab daemon uninstall (graceful when not installed)"

pt daemon uninstall
EXIT_CODE=$PT_CODE
# May exit 0 (nothing to uninstall) or 1 (systemd not available)
# Either is acceptable — just shouldn't crash
if [ $EXIT_CODE -le 1 ]; then
  echo -e "  ${GREEN}✓${NC} daemon uninstall handled gracefully (exit $EXIT_CODE)"
  ((ASSERTIONS_PASSED++)) || true
else
  echo -e "  ${RED}✗${NC} daemon uninstall crashed with exit $EXIT_CODE"
  ((ASSERTIONS_FAILED++)) || true
fi

end_test

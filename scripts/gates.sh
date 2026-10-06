#!/usr/bin/env bash
set -euo pipefail
echo "== lint ==";        : # TODO: your lint command
echo "== typecheck ==";   : # TODO
echo "== unit ==";        : # TODO
echo "== integration =="; : # TODO
echo "== AC coverage =="
# Fails if any AC id in the spec has no matching test name
SPEC="${1:-}"
if [ -n "$SPEC" ]; then
  for ac in $(grep -oE 'AC[0-9]+' "$SPEC" | sort -u); do
    grep -rq "test_${ac}_" tests/ || { echo "Missing test for $ac"; exit 1; }
  done
fi
echo "ALL GATES PASSED"

#!/bin/bash
# Installs locked dependencies for Claude Code cloud sessions so tests,
# typecheck and lint work. Local sessions keep their own toolchain.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

export TURBO_TELEMETRY_DISABLED=1
npm ci --no-audit --no-fund

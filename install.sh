#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/GloriaGuo/opencli-skill.git}"
TARGET="${1:-codex}"
CWD="$(pwd)"

resolve_target_dir() {
  case "$1" in
    codex)
      printf '%s\n' "${CODEX_HOME:-$HOME/.codex}/skills/opencli"
      ;;
    claude|claude-code)
      printf '%s\n' "$HOME/.claude/skills/opencli"
      ;;
    openclaw|openclaw-shared)
      printf '%s\n' "$HOME/.openclaw/skills/opencli"
      ;;
    openclaw-workspace)
      printf '%s\n' "$CWD/skills/opencli"
      ;;
    *)
      cat <<'EOF' >&2
Usage: ./install.sh [codex|claude|openclaw|openclaw-workspace]

Targets:
  codex               Install into ${CODEX_HOME:-$HOME/.codex}/skills/opencli
  claude              Install into ~/.claude/skills/opencli
  openclaw            Install into ~/.openclaw/skills/opencli
  openclaw-workspace  Install into ./skills/opencli
EOF
      exit 1
      ;;
  esac
}

TARGET_DIR="$(resolve_target_dir "$TARGET")"
PARENT_DIR="$(dirname "$TARGET_DIR")"

mkdir -p "$PARENT_DIR"

if [[ -d "$TARGET_DIR/.git" ]]; then
  echo "Updating existing install at $TARGET_DIR"
  git -C "$TARGET_DIR" pull --ff-only
else
  echo "Cloning $REPO_URL to $TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
fi

cat <<EOF

Installed OpenCLI skill to:
  $TARGET_DIR

Next steps:
  1. Ensure OpenCLI is installed: npm install -g @jackwener/opencli
  2. Run: opencli doctor
  3. Trigger the skill with: Use \$opencli to inspect the installed OpenCLI surface and run a read-first workflow.
EOF

#!/usr/bin/env bash
# Install Cursor Frontend Scrum Kit into a target repo's .cursor/ (flat — no nesting).
set -euo pipefail

KIT_REPO="${KIT_REPO:-https://github.com/matan2288/cursor-frontend-scrum-kit.git}"
KIT_TAG="${KIT_TAG:-v2.8}"
GENERIC_ONLY=0
TARGET_DIR=""

usage() {
  cat <<'EOF'
Usage: install.sh [OPTIONS] [TARGET_REPO_DIR]

Copy kit files into TARGET_REPO_DIR/.cursor/ (default: current directory).
Repo root = kit files; no .cursor/cursor-frontend-scrum-kit/ nesting.

Options:
  --generic-only   Refresh generic layers only; do not overwrite filled project-specific files
  --tag TAG        Kit git tag or branch (default: v2.8)
  --repo URL       Kit git remote (default: GitHub matan2288/cursor-frontend-scrum-kit)
  -h, --help       Show this help

Examples:
  ./scripts/install.sh .
  ./scripts/install.sh --generic-only /path/to/rex-sdk
  KIT_TAG=main ./scripts/install.sh .

After install, in Cursor:
  @workflows/integrate-kit.md
  Integrate the kit into this repo.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --generic-only) GENERIC_ONLY=1; shift ;;
    --tag) KIT_TAG="$2"; shift 2 ;;
    --repo) KIT_REPO="$2"; shift 2 ;;
    -h | --help) usage; exit 0 ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
    *)
      if [[ -n "$TARGET_DIR" ]]; then
        echo "Unexpected argument: $1" >&2
        exit 1
      fi
      TARGET_DIR="$1"
      shift
      ;;
  esac
done

TARGET_DIR="${TARGET_DIR:-.}"
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
CURSOR_DIR="${TARGET_DIR}/.cursor"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required." >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is required." >&2
  exit 1
fi

tmpdir="$(mktemp -d)"
cleanup() { rm -rf "$tmpdir"; }
trap cleanup EXIT

echo "Cloning ${KIT_REPO} (${KIT_TAG})..."
if ! git clone --depth 1 --branch "$KIT_TAG" "$KIT_REPO" "$tmpdir" 2>/dev/null; then
  echo "Clone failed. Check KIT_REPO / KIT_TAG and network access." >&2
  exit 1
fi

mkdir -p "$CURSOR_DIR"

if [[ "$GENERIC_ONLY" -eq 1 ]]; then
  echo "Generic-only refresh into ${CURSOR_DIR}/"
  rsync -av --exclude '.git' "$tmpdir/personas/" "$CURSOR_DIR/personas/"
  rsync -av --exclude '.git' "$tmpdir/workflows/" "$CURSOR_DIR/workflows/"
  rsync -av --exclude '.git' "$tmpdir/skills/" "$CURSOR_DIR/skills/"
  rsync -av --exclude '.git' "$tmpdir/rules/core/" "$CURSOR_DIR/rules/core/"
  rsync -av --exclude '.git' "$tmpdir/rules/README.mdc" "$CURSOR_DIR/rules/" 2>/dev/null || true
  rsync -av --exclude '.git' "$tmpdir/rules/frontend/" "$CURSOR_DIR/rules/frontend/"
  rsync -av --exclude '.git' "$tmpdir/rules/before-commit/" "$CURSOR_DIR/rules/before-commit/"
  rsync -av --exclude '.git' "$tmpdir/rules/planning/" "$CURSOR_DIR/rules/planning/"
  rsync -av --exclude '.git' "$tmpdir/rules/security/" "$CURSOR_DIR/rules/security/"
  rsync -av --exclude '.git' \
    "$tmpdir/GETTING-STARTED.md" \
    "$tmpdir/README.md" \
    "$tmpdir/KIT-CHANGELOG-LESSONS.md" \
    "$CURSOR_DIR/"
  mkdir -p "$CURSOR_DIR/rules/project-specific/prompts"
  rsync -av --exclude '.git' \
    "$tmpdir/rules/project-specific/README.mdc" \
    "$tmpdir/rules/project-specific/glossary.md" \
    "$tmpdir/rules/project-specific/network-template.md" \
    "$CURSOR_DIR/rules/project-specific/" 2>/dev/null || true
  rsync -av --exclude '.git' \
    "$tmpdir/rules/project-specific/prompts/" "$CURSOR_DIR/rules/project-specific/prompts/" 2>/dev/null || true
  for f in context.mdc project-lessons.md; do
    if [[ ! -f "$CURSOR_DIR/rules/project-specific/$f" ]]; then
      rsync -av "$tmpdir/rules/project-specific/$f" "$CURSOR_DIR/rules/project-specific/"
    fi
  done
else
  echo "Full install into ${CURSOR_DIR}/"
  rsync -av --exclude '.git' --exclude 'scripts/' "$tmpdir/" "$CURSOR_DIR/"
fi

if [[ -d "$CURSOR_DIR/cursor-frontend-scrum-kit" ]]; then
  echo "Error: nested .cursor/cursor-frontend-scrum-kit/ detected — aborting." >&2
  exit 1
fi

echo "Done. Kit files are in ${CURSOR_DIR}/"
echo "Next: @workflows/integrate-kit.md — Integrate the kit into this repo."

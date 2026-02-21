#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKTREE="${1:-$ROOT_DIR/.worktrees/default}"
MANIFEST_PATH="$ROOT_DIR/default.xml"
REPO_BIN="${REPO_BIN:-$WORKTREE/repo}"

mkdir -p "$WORKTREE"

if ! command -v repo >/dev/null 2>&1; then
  if [[ ! -x "$REPO_BIN" ]]; then
    echo "repo tool not found; downloading into $REPO_BIN"
    curl -fsSL https://storage.googleapis.com/git-repo-downloads/repo -o "$REPO_BIN"
    chmod +x "$REPO_BIN"
  fi
else
  REPO_BIN="$(command -v repo)"
fi

pushd "$WORKTREE" >/dev/null
"$REPO_BIN" init -u "$ROOT_DIR" -m "$(basename "$MANIFEST_PATH")"
"$REPO_BIN" sync -j"$(nproc)"
make -C build toolchains
make -C build
popd >/dev/null

echo "Build completed in $WORKTREE"

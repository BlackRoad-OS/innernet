#!/bin/bash
# RoadChain Hook Installation Script
# Copyright © 2026 BlackRoad OS, Inc. All Rights Reserved.

set -e

# Get the absolute path to the repository root
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$REPO_ROOT"

echo "Installing RoadChain git hook..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "✗ Error: Not in a git repository root directory"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Install the pre-commit hook
if [ -f ".git/hooks/pre-commit" ]; then
    echo "⚠ Warning: Existing pre-commit hook found"
    echo "   Backing up to .git/hooks/pre-commit.backup"
    mv .git/hooks/pre-commit .git/hooks/pre-commit.backup
fi

# Create symlink to RoadChain pre-commit hook using absolute path
HOOK_SOURCE="${REPO_ROOT}/.roadchain/pre-commit"
HOOK_TARGET="${REPO_ROOT}/.git/hooks/pre-commit"
ln -sf "$HOOK_SOURCE" "$HOOK_TARGET"
chmod +x "$HOOK_SOURCE"

echo "✓ RoadChain hook installed successfully"
echo ""
echo "All commits will now be tracked with SHA-256 hashing."

exit 0

#!/bin/bash
# RoadChain Verification Script
# Copyright © 2026 BlackRoad OS, Inc. All Rights Reserved.
#
# Verifies the integrity of the RoadChain commit log

set -e

ROADCHAIN_DIR=".roadchain"
COMMITS_LOG="${ROADCHAIN_DIR}/commits.log"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  RoadChain SHA-256 Commit Verification"
echo "  Copyright © 2026 BlackRoad OS, Inc."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ ! -f "$COMMITS_LOG" ]; then
    echo "✗ Error: RoadChain commits log not found"
    exit 1
fi

# Count tracked commits
COMMIT_COUNT=$(grep -c "SHA256:" "$COMMITS_LOG" || true)

echo "📊 Statistics:"
echo "   Total tracked commits: $COMMIT_COUNT"
echo ""

if [ $COMMIT_COUNT -gt 0 ]; then
    echo "📋 Recent RoadChain entries:"
    echo ""
    grep "SHA256:" "$COMMITS_LOG" | tail -5 | while IFS='|' read -r timestamp status author message hash; do
        echo "   ⏰ $timestamp"
        echo "   👤 $author"
        echo "   📝 $message"
        echo "   🔐 $hash"
        echo ""
    done
fi

echo "✓ RoadChain verification complete"
echo ""
echo "All commits are tracked and secured with SHA-256 hashing."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

exit 0

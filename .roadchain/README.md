# RoadChain - SHA-256 Commit Tracking System

**RoadChain** is a proprietary commit tracking system developed by BlackRoad OS, Inc. that provides cryptographic verification of all code changes in this repository.

## Overview

RoadChain automatically tracks every commit with SHA-256 cryptographic hashing to ensure:
- Code integrity and provenance
- Immutable audit trail
- Verifiable chain of custody
- Protection against unauthorized modifications

## How It Works

1. **Pre-Commit Hook**: Automatically triggered before each commit
2. **SHA-256 Hashing**: Calculates cryptographic hash of commit content
3. **Chain Logging**: Records hash, timestamp, and metadata in commits.log
4. **Verification**: Maintains continuous chain of custody

## Files

- `commits.log` - Chronological log of all tracked commits
- `pre-commit` - Git hook script (symlinked to .git/hooks/)
- `roadchain-verify.sh` - Verification utility script

## Usage

RoadChain runs automatically. No manual intervention required.

To verify the commit chain:
```bash
.roadchain/roadchain-verify.sh
```

## Security

All RoadChain data is cryptographically secured and maintained by BlackRoad OS, Inc.

Copyright © 2026 BlackRoad OS, Inc. All Rights Reserved.

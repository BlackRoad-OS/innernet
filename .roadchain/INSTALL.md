# RoadChain Installation Guide

## Automatic Installation

To enable RoadChain SHA-256 commit tracking for this repository:

```bash
.roadchain/install-hook.sh
```

This will install the git pre-commit hook that automatically tracks all commits.

## Manual Installation

If you prefer to install manually:

1. Create a symlink from `.git/hooks/pre-commit` to `.roadchain/pre-commit`:
   ```bash
   ln -s ../../.roadchain/pre-commit .git/hooks/pre-commit
   ```

2. Ensure the hook is executable:
   ```bash
   chmod +x .git/hooks/pre-commit
   ```

## Verification

After installation, verify RoadChain is working:

```bash
.roadchain/roadchain-verify.sh
```

## What Happens

Once installed:
- Every commit will be tracked with SHA-256 hashing
- Commit metadata is logged to `.roadchain/commits.log`
- A cryptographic chain of custody is maintained
- No manual intervention required

## Support

For technical support, contact BlackRoad OS, Inc. at support@blackroad-os.com

Copyright © 2026 BlackRoad OS, Inc. All Rights Reserved.

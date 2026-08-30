#!/usr/bin/env bash
# Deploy local theme changes the quick way (no GitHub push/pull roundtrip).
# Usage: ./deploy-local-changes.sh
set -euo pipefail
cd "$(dirname "$0")"

theme_dir="$HOME/.config/omarchy/themes/tsunderick"

# Clean previous local deploys so the README's `git pull` flow stays usable
git -C "$theme_dir" reset --hard -q HEAD

# Copy everything except .git into the deployed theme
tar --exclude=./.git -cf - . | tar -xf - -C "$theme_dir"

omarchy theme set tsunderick
omarchy restart terminal
echo "tsunderick deployed & refreshed"

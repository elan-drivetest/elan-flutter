#!/usr/bin/env bash
# DESTRUCTIVE: wipes all local git history and starts a fresh repo pointed at
# github.com/elan-drivetest/elan-flutter
#
# Your old history is NOT lost globally -- it still lives at
# github.com/oonkoo/elan-instructor-app. This only wipes the local .git.
set -euo pipefail

NEW_URL="https://github.com/elan-drivetest/elan-flutter.git"
BRANCH="main"
cd "$(dirname "$0")"

echo "==> repo: $(pwd)"
echo "==> this DELETES .git (all local history, branches, remotes)"
read -r -p "    type YES to continue: " ok
[ "$ok" = "YES" ] || { echo "aborted"; exit 1; }

# 1. nuke history
rm -rf .git

# 2. drop build artifacts so they don't land in the first commit
rm -rf build .dart_tool .flutter-plugins-dependencies _cowork_trash
rm -rf android/.gradle android/app/build ios/Pods ios/.symlinks ios/Flutter/Flutter.podspec

# 3. fresh repo
git init -b "$BRANCH"
git add -A
git commit -m "chore: initial commit"

# 4. point at the new repo and push
git remote add origin "$NEW_URL"
git push -u origin "$BRANCH"

echo
echo "==> done"
git remote -v
git log --oneline
echo
echo "next: rm migrate-repo.sh && flutter pub get && dart run build_runner build --delete-conflicting-outputs"

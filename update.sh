#!/usr/bin/env bash
# One-command update: pull, rebuild, wait until healthy, report what changed.
set -e
cd "$(dirname "$0")"

OLD=$(git rev-parse --short HEAD)
git pull origin main
NEW=$(git rev-parse --short HEAD)

echo "==> Building (takes a few minutes)..."
docker compose up -d --build

echo "==> Waiting for the container to become healthy..."
STATUS=""
for i in $(seq 1 30); do
  STATUS=$(docker compose ps --format '{{.Status}}' | head -n1)
  case "$STATUS" in
    *healthy*) break ;;
  esac
  sleep 2
done

echo
echo "=============== UPDATE FINISHED ==============="
echo "Status : $STATUS"
if [ "$OLD" = "$NEW" ]; then
  echo "Code   : no new commits ($NEW)"
else
  echo "Code   : $OLD -> $NEW"
  git --no-pager log --oneline "$OLD..$NEW"
fi
echo "Open   : hard-refresh the site (Ctrl+F5 / incognito)"
echo "==============================================="

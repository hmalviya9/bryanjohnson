#!/usr/bin/env bash
# Wayback Machine snapshot helper for the bryanjohnson-v3 dossier.
# Captures every external URL referenced in HTML and data/*.json so the
# dossier survives quick-commerce link-rot (Devil's Advocate HIGH severity).
#
# Usage:
#   ./scripts/wayback-snapshot.sh                # snapshot all URLs found
#   ./scripts/wayback-snapshot.sh --dry-run      # list URLs without snapshotting
#
# Output: scripts/wayback_log_<YYYY-MM-DD>.tsv with columns:
#   timestamp\tsource_file\toriginal_url\twayback_url\tstatus
#
# Cron suggestion (monthly): 0 3 1 * * /full/path/scripts/wayback-snapshot.sh
#
# NOTE: archive.org's save endpoint rate-limits aggressively. Respect
# WAYBACK_DELAY (default 6 sec) between calls.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DATE="$(date +%Y-%m-%d)"
LOG="$ROOT/scripts/wayback_log_${DATE}.tsv"
DRY_RUN="${1:-}"
WAYBACK_DELAY="${WAYBACK_DELAY:-6}"

# Collect every http(s) URL from .html and data/*.json
mapfile -t URLS < <(
  grep -hroEi 'https?://[^"<>)[:space:]]+' \
    "$ROOT"/*.html \
    "$ROOT"/data/*.json 2>/dev/null \
  | sed 's/[",.;:)]*$//' \
  | grep -vE '(fonts\.googleapis|fonts\.gstatic|web\.archive\.org)' \
  | sort -u
)

echo "Found ${#URLS[@]} unique external URLs to snapshot."

if [ "$DRY_RUN" = "--dry-run" ]; then
  printf '%s\n' "${URLS[@]}"
  exit 0
fi

mkdir -p "$ROOT/scripts"
printf 'timestamp\tsource_file\toriginal_url\twayback_url\tstatus\n' > "$LOG"

for url in "${URLS[@]}"; do
  ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  save="https://web.archive.org/save/${url}"
  # Capture and follow the redirect to the resulting Wayback URL
  result="$(curl -sIL --max-time 60 "$save" \
    | awk 'BEGIN{IGNORECASE=1} /^location:/ {print $2}' \
    | tr -d '\r' | tail -1)"
  if [ -n "${result:-}" ]; then
    status="ok"
  else
    result="-"
    status="failed"
  fi
  printf '%s\t%s\t%s\t%s\t%s\n' "$ts" "all" "$url" "$result" "$status" >> "$LOG"
  echo "[$status] $url"
  sleep "$WAYBACK_DELAY"
done

echo "Done. Log: $LOG"

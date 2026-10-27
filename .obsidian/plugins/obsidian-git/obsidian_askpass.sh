#!/bin/sh

if ! command -v curl >/dev/null 2>&1; then
    echo "Obsidian Git authentication requires curl" >&2
    exit 1
fi

printf '%s\n%s' "$OBSIDIAN_GIT_ASKPASS_TOKEN" "$1" | curl -q \
    --silent --show-error --fail --noproxy '*' --proto '=http' \
    --max-time 600 --data-binary @- \
    --header 'Content-Type: application/octet-stream' \
    "http://127.0.0.1:$OBSIDIAN_GIT_ASKPASS_PORT/askpass"

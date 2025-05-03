#!/usr/bin/env bash

root_dir="$1"  # <- Change this to your actual folder
dry_run=false

# Check for --dry-run argument
if [ "$2" == "--dry-run" ]; then
    dry_run=true
    echo "[DRY RUN] No files will be deleted."
fi

find "$root_dir" -type f -iname "*.flac" | while read -r flac_file; do
    dir=$(dirname "$flac_file")
    base=$(basename "$flac_file" .flac)
    mp3_file="$dir/$base.mp3"

    if [ -f "$mp3_file" ]; then
        if [ "$dry_run" = true ]; then
            echo "[DRY RUN] Would delete: $mp3_file"
        else
            echo "Deleting duplicate MP3: $mp3_file"
            rm "$mp3_file"
        fi
    fi
done




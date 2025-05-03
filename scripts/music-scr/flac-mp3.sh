#!/usr/bin/env bash

root_dir="$1"  # <- Change this to your actual folder

find "$root_dir" -type f -iname "*.flac" | while read -r flac_file; do
    dir=$(dirname "$flac_file")
    base=$(basename "$flac_file" .flac)
    mp3_file="$dir/$base.mp3"
    if [ -f "$mp3_file" ]; then
        echo "Deleting -> $mp3_file"
        rm -f "$mp3_file"
    fi
done



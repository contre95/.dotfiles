#!/run/current-system/sw/bin/bash

# Normalize filenames

# Capture rsync output (stdout + stderr) and preserve line breaks
CONVERT=$(
  convmv -r -f utf-8 -t utf-8 --nfc --notest /mnt/HDD2/music/  2>&1
)
RSYNC=$(
  rsync -avr --ignore-existing --include='*' --stats --exclude='*.lrc' /mnt/HDD2/music/ /mnt/ipod/Music/ 2>&1 |
    sed '0,/^$/d' | grep -e "Number of" -e "File list size"
)

# Perform playlist sync and capture any errors (optional)
/home/contre/.nix-profile/bin/rsync -av --inplace --info=progress2 /mnt/SSD/config/emby/data/userplaylists/ /mnt/ipod/Playlists 2>&1

# Combine outputs

# Send via curl using --data-urlencode to preserve formatting
/run/current-system/sw/bin/curl -s -X POST --data "iPod Sync ✅ --- $CONVERT - $RSYNC" https://ntfy.contre.io/all

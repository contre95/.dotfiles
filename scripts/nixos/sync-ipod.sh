#!/run/current-system/sw/bin/bash

notify() {
  local status="$1"
  local message="$2"
  /run/current-system/sw/bin/curl -s -X POST --data "$status --- $message" https://ntfy.contre.io/all
}

fail_and_notify() {
  local step="$1"
  notify "iPod Sync ❌" "$step failed"
  exit 1
}

# Step 1: Normalize filenames
CONVERT=$(
  /home/contre/.nix-profile/bin/convmv -r -f utf-8 -t utf-8 --nfc --notest /mnt/HDD2/music/ 2>&1
)
[ $? -ne 0 ] && fail_and_notify "convmv"

# Step 2: Sync music
RSYNC=$(
  /home/contre/.nix-profile/bin/rsync -avr --ignore-existing --include='*' --stats --exclude='*.lrc' /mnt/HDD2/music/ /mnt/ipod/Music/ 2>&1 |
  sed '0,/^$/d' | grep -e "Number of" -e "File list size"
)
[ $? -ne 0 ] && fail_and_notify "rsync music"

# Step 3: Sync playlists
PLAYLIST_SYNC=$(
  /home/contre/.nix-profile/bin/rsync -av --inplace --info=progress2 /mnt/SSD/config/emby/data/userplaylists/ /mnt/ipod/Playlists 2>&1
)
[ $? -ne 0 ] && fail_and_notify "rsync playlists"

# Success: send notification and unmount
notify "iPod Sync ✅" "$CONVERT - $RSYNC"

# Step 4: Unmount
if /run/wrappers/bin/umount /mnt/ipod; then
  notify "iPod Sync ☑️ " "iPod umounted"
else
  notify "iPod Sync ⚠️" "Unmount failed"
fi


#!/run/current-system/sw/bin/bash

notify() {
  local status="$1"
  local message="$2"
  /run/current-system/sw/bin/curl -s -X POST --data "$status --- $message" https://ntfy.contre.io/all
}

fail_and_notify() {
  local step="$1"
  notify "iPod Sync ❌" "$step failed"
  echo "[ERROR] Step '$step' failed. Exiting."
  exit 1
}

echo "[INFO] Starting iPod Sync process..."

# Step 1: Normalize filenames
echo "[INFO] Step 1: Normalize filenames (convmv)"
notify "iPod Sync ⏳" "Starting filename normalization"
CONVERT_OUTPUT=$(/home/contre/.nix-profile/bin/convmv -r -f utf-8 -t utf-8 --nfc --notest /mnt/HDD2/music/ 2>&1)
CONVERT_EXIT=$?

echo "[DEBUG] convmv output:"
echo "$CONVERT_OUTPUT"

if [ $CONVERT_EXIT -ne 0 ]; then
  fail_and_notify "convmv"
fi

notify "iPod Sync ✔️" "Filename normalization completed"

# Step 2: Sync music
echo "[INFO] Step 2: Sync music (rsync)"
notify "iPod Sync ⏳" "Starting music sync"
RSYNC_OUTPUT=$(/home/contre/.nix-profile/bin/rsync -avr --ignore-existing --include='*' --stats --exclude='*.lrc' /mnt/HDD2/music/ /mnt/ipod/Music/ 2>&1)
RSYNC_EXIT=$?

echo "[DEBUG] rsync output:"
echo "$RSYNC_OUTPUT" | sed '0,/^$/d' | tee /dev/stderr | grep -e "Number of" -e "File list size"

if [ $RSYNC_EXIT -ne 0 ]; then
  fail_and_notify "rsync music"
fi

notify "iPod Sync ✔️" "Music sync completed"

# Step 3: Sync playlists
echo "[INFO] Step 3: Sync playlists (rsync)"
notify "iPod Sync ⏳" "Starting playlists sync"
PLAYLIST_OUTPUT=$(/home/contre/.nix-profile/bin/rsync -av --inplace --info=progress2 /mnt/SSD/config/emby/data/userplaylists/ /mnt/ipod/Playlists 2>&1)
PLAYLIST_EXIT=$?

echo "[DEBUG] playlists rsync output:"
echo "$PLAYLIST_OUTPUT"

if [ $PLAYLIST_EXIT -ne 0 ]; then
  fail_and_notify "rsync playlists"
fi

notify "iPod Sync ✔️" "Playlists sync completed"

# Final success notification with summaries
notify "iPod Sync ✅" "Filename normalization done; Music synced; Playlists synced."

# Step 4: Unmount
echo "[INFO] Step 4: Unmount iPod"
if /run/wrappers/bin/umount /mnt/ipod; then
  echo "[INFO] Unmounted /mnt/ipod successfully."
  notify "iPod Sync ☑️" "iPod unmounted successfully"
else
  echo "[WARN] Failed to unmount /mnt/ipod."
  notify "iPod Sync ⚠️" "Unmount failed"
fi

echo "[INFO] iPod Sync process completed."


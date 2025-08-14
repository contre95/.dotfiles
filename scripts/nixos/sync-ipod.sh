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
# Step 1: Check Nix environment
echo "[INFO] Checking Nix env"
if [ "$(hostname)" != "server" ]; then
  printf "Be sure to: \n 1. Be connected to the VPN.\n 2. Have your yubikey connected.\n";
  mkdir -p /mnt/HDD2/music-beets-tag;
  mkdir -p /mnt/HDD2/playlists;
  printf "Mounting Server Music:"
  sshfs server.home:/mnt/HDD2/music-beets-tag /mnt/HDD2/music-beets-tag || { echo "sshfs mount failed. Exiting."; exit 1; }
  printf "Mounting Emby Playlists:"
  sshfs server.home:/mnt/SSD/config/emby/data/userplaylists/ /mnt/HDD2/playlists || { echo "sshfs mount failed. Exiting."; exit 1; }
fi

# Step 2: Sync music
echo "[INFO] Step 2: Sync music (rsync)"
notify "iPod Sync ⏳" "Starting music sync"
RSYNC_OUTPUT=$(/home/contre/.nix-profile/bin/rsync -avr --ignore-existing --include='*' --stats --exclude='*.lrc' /mnt/HDD2/music-beets-tag/ /mnt/ipod/Music/ 2>&1)
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
# echo "[INFO] Step 4: Unmount iPod"
# if /run/wrappers/bin/umount /mnt/ipod; then
#   echo "[INFO] Unmounted /mnt/ipod successfully."
#   notify "iPod Sync ☑️" "iPod unmounted successfully"
# else
#   echo "[WARN] Failed to unmount /mnt/ipod."
#   notify "iPod Sync ⚠️" "Unmount failed"
# fi

echo "[INFO] iPod Sync process completed."


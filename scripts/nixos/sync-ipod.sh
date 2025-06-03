#!/nix/store/$(realpath $(which bash) | cut -d/ -f4-)/bin/bash

echo hi
#
# DISK_UUID="a55281ac"
# MOUNT_POINT="/mnt/ipod-classic"
# TARGET_FOLDER="/mnt/SSD/config/emby/data/userplaylists"
#
# exec >> /var/log/sync-disk.log 2>&1
# echo "[$(date)] Disk sync triggered"
#
# sleep 2
#
# DEVICE=$(blkid -U "$DISK_UUID")
#
# if [ -z "$DEVICE" ]; then
#   echo "Disk not found"
#   curl -d "Disk $DISK_UUID not found" https://ntfy.contre.io/all
#   exit 1
# fi
#
# mkdir -p "$MOUNT_POINT"
#
# mount "$DEVICE" "$MOUNT_POINT"
#
# if [ $? -ne 0 ]; then
#   curl -d "Mount failed for $DEVICE" https://ntfy.contre.io/all
#   exit 1
# fi
#
# rsync -av --delete "$MOUNT_POINT/" "$TARGET_FOLDER"
#
# curl -d "Disk sync completed successfully for $DEVICE" https://ntfy.contre.io/all
#
# umount "$MOUNT_POINT"
#

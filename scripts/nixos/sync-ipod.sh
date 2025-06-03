#!/run/current-system/sw/bin/bash
/home/contre/.nix-profile/bin/rsync -av --inplace --info=progress2 /mnt/SSD/config/emby/data/userplaylists/ /mnt/ipod/Playlists &&\
/run/current-system/sw/bin/curl -d "Disk sync completed successfully for IPod" https://ntfy.contre.io/all

sudo mount -t cifs //server.local/SambaMusic /mnt/Samba/Music -o username=contre,password=lucasc9512,workgroup=CONTRE,iocharset=utf8,uid=contre
sudo rsync -a /home/lucas/Music/* /mnt/Samba/Music --verbose


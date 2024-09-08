{...}:
{

   fileSystems."/mnt/HDD2" = {
     device = "/dev/sdb1";
     fsType = "ext4"; # Replace with your filesystem type
   };

   fileSystems."/mnt/SSD" = {
     device = "/dev/sda1";
     fsType = "ext4"; # Replace with your filesystem type
   };

   fileSystems."/mnt/HDD" = {
     device = "/dev/sdc1";
     fsType = "ext4"; # Replace with your filesystem type
   };

  }

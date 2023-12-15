{ config, ... }: {

  boot = {
    initrd = {
      luks.devices."data".device = "/dev/disk/by-partlabel/disk-main-cryptdata";
    };

    supportedFilesystems = [ "zfs" ];
  };

  fileSystems = {
    "/data" = {
      device = "zdata/persist";
      fsType = "zfs";
      options = [ "xattr" "posixacl" ];
      neededForBoot = true;
    };
  };
}

{ target, ... }: {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = target;
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            nixos = {
              size = "100%";
              type = "8300";
              content = {
                type = "luks";
                extraOpenArgs = [
                  "--allow-discards"
                  "--perf-no_write_workqueue"
                  "--perf-no_read_workqueue"
                ];
                settings = { allowDiscards = true; };
                content = {
                  type = "zfs";
                  pool = "zroot";
                };
              };
            };
          };
        };
      };
    };
    nodev = {
      "/" = {
        fsType = "tmpfs";
      };
    };
    zpool = {
      zroot = {
        type = "zpool";

        rootFsOptions = {
          acltype = "posixacl";
          atime = "off";
          compression = "zstd";
          dnodesize = "auto";
          mountpoint = "none";
          normalization = "formD";
          relatime = "on";
          xattr = "sa";
          "com.sun:auto-snapshot" = "false";
          canmount = "on";
        };

        options = {
          ashift = "13";
          autotrim = "on";
          listsnapshots = "on";
        };

        mountpoint = "/";

        datasets = {
          reservation = {
            type = "zfs_fs";
            options = {
              canmount = "off";
              mountpoint = "none";
              refreservation = "35G";
              primarycache = "none";
              secondarycache = "none";
            };
          };

          nix = {
            type = "zfs_fs";
            mountOptions = [ "noatime" "nodiratime" ];
            options = {
              canmount = "on";
              mountpoint = "/nix";
              relatime = "off";
              atime = "off";
              secondarycache = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };

          persist = {
            type = "zfs_fs";
            options = {
              canmount = "on";
              mountpoint = "/persist";
            };
          };
        };
      };
    };
  };
}

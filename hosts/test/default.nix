{ lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/f

    ../common/optional/sound.nix
    ../common/optional/network-manager.nix
    ../common/optional/zram.nix
    ../common/optional/all-fs.nix
    ../common/optional/virtualization
    ../common/optional/virtualbox.nix
  ];

  networking.hostName = "test";
  networking.hostId = lib.mkDefault "8425e349";
}

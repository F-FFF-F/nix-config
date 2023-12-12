{ lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/f

    ../common/optional/sound.nix
    ../common/optional/all-binfmt.nix
    ../common/optional/network-manager.nix
    ../common/optional/zram.nix
  ];

  networking.hostName = "test";
  networking.hostId = lib.mkDefault "8425e349";
}

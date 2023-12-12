{ lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/f

    ../common/tweak/common
    ../common/tweak/desktop

    ../common/optional/sound.nix
    ../common/optional/network-manager.nix
    ../common/optional/zram.nix
    ../common/optional/all-fs.nix
    ../common/optional/virtualisation
  ];

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  networking.hostName = "test";
  networking.hostId = lib.mkDefault "8425e349";
}

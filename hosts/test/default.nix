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
    ../common/optional/ananicy.nix
    ../common/optional/dns/adguard-home.nix
    ../common/optional/dns/use-adguard-home.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  networking.hostName = "test";
  networking.hostId = lib.mkDefault "8425e349";
}

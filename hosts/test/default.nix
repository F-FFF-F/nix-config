{
  imports = [
    ./hardware-configuration

    ../common/global
    ../common/users/f

    ../common/optional/sound.nix
    ../common/optional/binfmt.nix
    ../common/optional/network-manager.nix
  ];

  networking.hostName = "test";
}

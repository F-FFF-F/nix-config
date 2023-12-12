{ pkgs, config, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.misterio = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ] ++ ifTheyExist [
      "minecraft"
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
      "networkmanager"

      "cdrom"
      "tape"
      "input"
      "games"
      "floppy"
    ];

    initialHashedPassword = "test";
    packages = [ pkgs.home-manager ];
  };

  fileSystems = {
    "/home/f" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=100%" ];
    };
  };

  programs.fuse.userAllowOther = true;

  home-manager.users.f =
    import ../../../../homes/f/${config.networking.hostName}.nix;
}

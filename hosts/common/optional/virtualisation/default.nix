{ pkgs, ... }: {
  imports = [
    ./libvirtd.nix
    ./lxc.nix
    ./qemu.nix
    ./docker.nix
    ./lxd.nix
    ./waydroid.nix
  ];
}

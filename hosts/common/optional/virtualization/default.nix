{ pkgs, ... }: {
  imports = [
    ./libvirtd.nix
    ./lxc.nix
    ./qemu.nix
  ]
}

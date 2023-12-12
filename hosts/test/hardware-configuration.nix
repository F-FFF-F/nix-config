{ lib, inputs, outputs, pkgs, ... }: {
  imports = [
    "${inputs.nixpkgs}/nixos/modules/profiles/all-hardware.nix"
    "${inputs.nixpkgs}/nixos/modules/profiles/qemu-guest.nix"

    ../common/fstab/zfs.nix
    ../common/fstab/impermanence.nix
  ];
  boot = {
    initrd = {
      availableKernelModules = [
        "aesni_intel"
        "cryptd"
        "uas"
        "usbcore"
        "usb_storage"
        "vfat"
        "nls_cp437"
        "nls_iso8859_1"
      ];
      kernelModules = [ "kvm-intel" "kvm-amd" ];
    };
  };

  opengl = {
      driSupport = true;
      driSupport32Bit = true;
  };

  hardware.enableAllFirmware = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "23.11";
}

{
  imports = [
    "${inputs.nixpkgs}/modules/profiles/all-hardware.nix"
    "${inputs.nixpkgs}/modules/profiles/qemu-guest.nix"
    ../common/fstab/zfs.nix
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

  hardware.enableAllFirmware = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "23.10";
}

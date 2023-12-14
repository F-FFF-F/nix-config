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
      kernelModules = [ "amdgpu" "kvm-intel" "kvm-amd" "msr" ];
    };
  };

  systemd.tmpfiles.rules =
    [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr

      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  environment.variables = {
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };

  hardware.cpu.intel.updateMicrocode = true;
  services.fstrim.enable = true;
  services.zfs.trim.enable = true;

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "23.11";
}

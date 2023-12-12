{ pkgs, ... }: {
  virtualisation = {
    kvmgt = { enable = true; };
    libvirtd = {
      qemu = {
        swtpm = { enable = true; };
        package = pkgs.qemu_full;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull ];
        };
      };
    };
    spiceUSBRedirection = { enable = true; };
  };
}

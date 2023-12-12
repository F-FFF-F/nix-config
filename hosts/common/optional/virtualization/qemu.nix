{ pkgs, ... }: {
  virtualization = {
    kvmgt = {
     enable = true; 
    };
    libvirtd = {
      qemu = {
        virtioKeyboard = true;
        enable = true;
        swtpm = { enable = true; };
        package = pkgs.qemu_full;
        ovmf = {
          enable = true;
          packages = [
            OVMFFull
          ];
        };
      };
    };
  };
}

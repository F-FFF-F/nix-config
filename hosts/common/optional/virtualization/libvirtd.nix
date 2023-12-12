{ pkgs, ... }: {
  virtualization = {
    libvirtd = {
      enable = true;
    };
  };
}

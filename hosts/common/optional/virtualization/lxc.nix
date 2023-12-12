{ pkgs, ... }: {
  virtualization = {
    lxc = {
      enable = true;
      lxcfs = { enable = true; };
      lxd = { enable = true; };
    };
  };
}

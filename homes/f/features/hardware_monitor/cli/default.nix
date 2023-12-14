{ pkgs, config, ... }: {
  home.packages = with pkgs;
    [
      amdgpu_top
      vdpauinfo
      libva-utils
      vulkan-tools
      radeontop
    ];
}

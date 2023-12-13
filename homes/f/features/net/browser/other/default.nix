{ pkgs, config, ... }: {
  home.packages = with pkgs;
    [
      palemoon
      opera
      palemoon-bin
      microsoft-edge
    ];
}

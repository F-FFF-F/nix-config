{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    tg-session-keeper
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    sops
    ssh-to-age
    gnupg
    age

    nil
    nixd
    nixel
    nixci
    nixdoc
    nix-ld
    nix-du
    nixbang
    nixfmt

    curlFull
    wget
  ];
}

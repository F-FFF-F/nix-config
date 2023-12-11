{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ ];
        pkgs = import nixpkgs { inherit system overlays; };
      in {
        NIX_CONFIG =
          "extra-experimental-features = nix-command flakes repl-flake";
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nix
            home-manager
            git

            sops
            ssh-to-age
            gnupg
            age
          ];
        };
      });
}

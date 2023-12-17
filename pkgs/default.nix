{ pkgs ? import <nixpkgs> { } }: rec {
    tg-session-keeper = pkgs.callPackage ./tg-session-keeper;
}

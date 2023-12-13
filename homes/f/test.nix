{ inputs, outputs, pkgs, lib, ... }: {
  imports = [
    ./global

    ./features/basic
    ./features/desktop/common
    ./features/compression
  ];
}

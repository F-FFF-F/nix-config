{ inputs, outputs, pkgs, lib, ... }: {
  imports = [
    ./global

    ./features/basic
    ./features/desktop/common
    ./features/compression
    ./features/image_optimization
  ];
}

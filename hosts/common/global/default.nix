{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.chaotic.nixosModules.default

    ./locale.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
      allowUnfreePredicate = (_: true);
      input-fonts.acceptLicense = true;
      nvidia.acceptLicense = true;
      oraclejdk.accept_license = true;

      permittedInsecurePackages = [ "electron-25.9.0" ];
    };
  };
}

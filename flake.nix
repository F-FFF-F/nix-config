{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.joypixels.acceptLicense = true;
          config.allowUnfreePredicate = (_: true);
        });
    in {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      templates = import ./templates;

      overlays = import ./overlays { inherit inputs outputs; };

      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      nixosConfigurations = {
        test = lib.nixosSystem {
          modules = [ ./hosts/test ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      homeConfigurations = {
        "f@test" = lib.homeManagerConfiguration {
          modules = [ ./home/misterio/atlas.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}

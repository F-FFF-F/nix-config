{ inputs, lib, pkgs, config, outputs, ... }:

{
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  systemd.user.startServices = "sd-switch";

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      package = pkgs.gitFull;
      lfs = { enable = true; };
      userName = "F-FFF-F";
      userEmail = "ffffffffg@skiff.com";
    };
  };

  home = {
    username = lib.mkDefault "f";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";

    persistence = {
      "/persist/${config.home.homeDirectory}" = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          "VirtualBox VMs"
          "VM"
          "Templates"
          "Public"
          "Desktop"
          "NixConfig"
          ".gnupg"
          ".ssh"
          ".nixops"
          ".mozilla"
          ".vscode"
          ".vscode-insiders"
          ".vscodium"

          ".local/share/keyrings"
          ".local/share/direnv"
          ".local/share/tor-browser"
          ".local/bin"

          ".config/Code"
          ''.config/"Code - Insiders"''
          ".config/VSCodium"
        ];
        allowOther = true;
      };
    };
  };
}

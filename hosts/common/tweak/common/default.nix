{ config, ... }: {
  imports = [
    ./file-max.nix
    ./fix-transparent-proxy.nix
    ./max-map-count.nix
    ./network.nix
    ./preempt.nix
    ./quiet.nix
    ./shell-on-fail.nix
    ./unprivileged-clone.nix
  ];
}

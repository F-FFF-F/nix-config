{ config, ... }: {
  imports = [
    ./dirty-bytes.nix
    ./disable-icmp.nix
    ./disable-mitigations.nix
    ./disable-watchdog
    ./ecn.nix
    ./good-response-time.nix
    ./iomem.nix
    ./iommu.nix
  ];
}

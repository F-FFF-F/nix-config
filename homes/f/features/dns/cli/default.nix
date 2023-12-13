{ pkgs, config, ... }: {
  home.packages = with pkgs;
    [
      dnsutils
      bind
      knot-dns
      knot-resolver
      unbound-full  
    ];
}

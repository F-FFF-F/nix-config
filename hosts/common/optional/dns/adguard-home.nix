{ config, pkgs, ... }: {
  services.adguardhome = {
    enable = true;
    extraArgs = [ "--no-etc-hosts" ];
    mutableSettings = false;
    allowDHCP = true;
    settings = {
      dns = {
        bind_hosts = [ "127.0.0.1" "::1" ];
        bind_port = 53;
        anonymize_client_ip = true;
        ratelimit = 0;
        refuse_any = false;
        fastest_addr = true;
        upstream_dns = [
          "https://dns.cloudflare.com/dns-query"
          "https://dns.google/dns-query"
          "https://unfiltered.adguard-dns.com/dns-query"
        ] ++ [
          "193.58.251.251" # SkyDNS
          "77.88.8.8" # YandexDNS
        ];
        cache_optimistic = true;
        cache_size = 536870912; # 512 MB
        cache_ttl_min = 1800;
        cache_ttl_max = 3600;
        fallback_dns = [
          "https://dns11.quad9.net/dns-query"
          "https://doh.libredns.gr/dns-query"
          "https://doh.sandbox.opendns.com/dns-query"
          "https://dns.alidns.com/dns-query"
          "quic://unfiltered.dns.bebasid.com:853"
          "https://dns.bebasid.com/unfiltered"
          "quic://unfiltered.adguard-dns.com"
          "195.10.195.195" # OpenNIC
          "https://dns.comss.one/dns-query"
        ];
        bootstrap_dns = [ "8.8.8.8" ];
      };
    };
  };
}

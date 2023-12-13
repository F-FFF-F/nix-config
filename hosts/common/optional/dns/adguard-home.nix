{ config, pkgs, ... }: {
  services.adguardhome = {
    enable = true;
    extraArgs = [ "--no-etc-hosts" ];
    mutableSettings = true;
    allowDHCP = true;
    settings = {
      dns = {
        edns_client_subnet.enabled = true;
        fastest_addr = true;
        use_http3_upstreams = true;
        upstream_dns = [
          "h3://dns.cloudflare.com/dns-query"
          "h3://dns.google/dns-query"
          "h3://unfiltered.adguard-dns.com/dns-query"
          "quic://unfiltered.adguard-dns.com"
          "h3://dns11.quad9.net/dns-query"
        ] ++ [
          "h3://dns.comss.one/dns-query"
          "193.58.251.251" # SkyDNS
          "h3://77.88.8.8:443" # YandexDNS
        ] ++ [
          "h3://doh.libredns.gr/dns-query"
          "h3://doh.sandbox.opendns.com/dns-query"
          "h3://dns.alidns.com/dns-query"
          "quic://unfiltered.dns.bebasid.com:853"
          "h3://dns.bebasid.com/unfiltered"
          "195.10.195.195" # OpenNIC
        ];
        cache_optimistic = true;
        cache_size = 536870912; # 512 MB
        cache_ttl_min = 1800;
        cache_ttl_max = 3600;
        enable_dnssec = true;
        aaaa_disabled = true;
        upstream_timeout = "2s";
        fallback_dns = [ "1.1.1.1" "8.8.8.8" "9.9.9.9" ];
        bootstrap_dns = [ "1.1.1.1" ];
        resolve_clients = true;
      };
    };
  };
}

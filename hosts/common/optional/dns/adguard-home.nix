{ config, pkgs, ... }: {
  services.adguardhome = {
    enable = true;
    extraArgs = [ "--no-etc-hosts" ];
    mutableSettings = true;
    allowDHCP = true;
    settings = {
      dns = {
        bind_hosts = [ "127.0.0.1" "::1" ];
        bind_port = 53;
        anonymize_client_ip = true;
        ratelimit = 0;
        refuse_any = false;
        edns_client_subnet.enabled = true;
        fastest_addr = true;
        use_http3_upstreams = true;
        upstream_dns = [
          "https://77.88.8.8:443" # YandexDNS
          "193.58.251.251" # SkyDNS
          "https://dns.comss.one/dns-query"
        ] ++ [
          "https://dns.cloudflare.com/dns-query"
          "https://dns.google/dns-query"
        ];
        cache_optimistic = true;
        cache_size = 536870912; # 512 MB
        cache_ttl_min = 1800;
        cache_ttl_max = 3600;
        enable_dnssec = true;
        aaaa_disabled = true;
        upstream_timeout = "2s";
        fallback_dns = [
          "1.1.1.1"
          "8.8.8.8"
          "9.9.9.9"
          "https://dns11.quad9.net/dns-query"
          "https://doh.libredns.gr/dns-query"
          "https://doh.sandbox.opendns.com/dns-query"
          "https://dns.alidns.com/dns-query"
          "quic://unfiltered.dns.bebasid.com:853"
          "https://dns.bebasid.com/unfiltered"
          "195.10.195.195" # OpenNIC
        ];
        bootstrap_dns = [ "77.88.8.8" ];
        resolve_clients = false;
      };
    };
  };
}

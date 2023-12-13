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
        edns_client_subnet = {
          enabled = true;
        };
        fastest_addr = true;
        use_http3_upstreams = true;
        upstream_dns = [
          "https://77.88.8.8:443" # YandexDNS
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
        filters = [
          {
            name = "oisd big";
            url = "https://big.oisd.nl";
            enabled = true;
            id = 1;
          }
          {
            name = "EasyList RU";
            url =
              "https://raw.githubusercontent.com/easylist/ruadlist/master/advblock/adservers.txt";
            enabled = true;
            id = 2;
          }
          {
            name = "AdGuard Base filter cryptominers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/BaseFilter/sections/cryptominers.txt";
            enabled = true;
            id = 3;
          }
          {
            name = "AdGuard Base filter";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/BaseFilter/sections/adservers.txt";
            enabled = true;
            id = 4;
          }
          {
            name = "AdGuard Base filter — first-party servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/BaseFilter/sections/adservers_firstparty.txt";
            enabled = true;
            id = 5;
          }
          {
            name = "AdGuard Base filter — foreign servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/BaseFilter/sections/foreign.txt";
            enabled = true;
            id = 6;
          }
          {
            name = "AdGuard common Cyrillic filters ad servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/CyrillicFilters/common-sections/adservers.txt";
            enabled = true;
            id = 7;
          }
          {
            name =
              "AdGuard common Cyrillic filters ad servers — first-party servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/CyrillicFilters/common-sections/adservers_firstparty.txt";
            enabled = true;
            id = 8;
          }
          {
            name = "AdGuard Ukrainian filter — first-party servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/CyrillicFilters/UkrainianFilter/sections/adservers_firstparty.txt";
            enabled = true;
            id = 9;
          }
          {
            name = "AdGuard Russian filter — first-party servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/CyrillicFilters/RussianFilter/sections/adservers_firstparty.txt";
            enabled = true;
            id = 10;
          }
          {
            name = "AdGuard Belarusian language ad servers";
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/CyrillicFilters/Belarusian/sections/filter.txt";
            enabled = true;
            id = 11;
          }
        ];
        whitelist_filters = [
          {
            name = "1hosts exclusions";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/badmojr/1Hosts/master/submit_here/exclude_for_all.txt";
            id = 1;
          }
          {
            name = "RU Adlist whitelist";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/easylist/ruadlist/master/advblock/whitelist.txt";
            id = 2;
          }
          {
            name = "AdGuard exclusions";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdGuardSDNSFilter/master/Filters/exclusions.txt";
            id = 3;
          }
          {
            name = "AdGuard exceptons";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/AdguardTeam/AdGuardSDNSFilter/master/Filters/exceptions.txt";
            id = 4;
          }
          {
            name = "additional_hosts_duckduckgo";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/whitelist/duckduckgo.txt";
            id = 5;
          }
          {
            name = "anudeep_whitelist";
            enabled = true;
            url =
              "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt";
            id = 6;
          }
        ];
      };
    };
  };
}

{ config, pkgs, ... }: {
  services.smartdns = {
    enable = true;
    bindPort = 53;
    settings = {
      force-AAAA-SOA = true;
      speed-check-mode = "ping,tcp:443,tcp:80";
      response-mode = "fastest-ip";
      cache-size = 32768;
      prefetch-domain = true;
      serve-expired = true;
      serve-expired-ttl = 259200;
      serve-expired-reply-ttl = 3;
      server = [ "1.1.1.1 -bootstrap-dns" ];
      server-https = [
        "https://dns.cloudflare.com/dns-query"
        "https://dns.google/dns-query"
        "https://dns.alidns.com/dns-query"
        "https://dns.cfiec.net/dns-query"
        "https://freedns.controld.com/p0"
        "https://doh.dns.sb/dns-query"
        "https://doh.pub/dns-query"
        "https://doh.mullvad.net/dns-query" # causes problems
        "https://anycast.dns.nextdns.io"
        "https://ada.openbld.net/dns-query"
        "https://zero.dns0.eu/"
        "https://basic.rethinkdns.com/"
        "https://doh.360.cn/dns-query"
        "https://dns.comss.one/dns-query" # comms.one (Poland and Russia)
        "https://77.88.8.8:443" # YandexDNS (Russia)
      ];
    };
  };
}

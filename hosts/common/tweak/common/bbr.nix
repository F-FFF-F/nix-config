{ config, ... }: { boot = { kernelModules = [ "tcp_bbr" ]; }; }

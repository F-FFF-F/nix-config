{ config, ... }: {
  boot = {
    kernelParams = [
      "nmi_watchdog=0"
    ];
  };
}

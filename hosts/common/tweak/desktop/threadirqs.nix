{ config, ... }: {
  boot = {
    kernelParams = [
      "threadirqs"
    ];
  };
}

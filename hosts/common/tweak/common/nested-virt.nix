{ config, ... }: {
  boot = {
    extraModprobeConfig = ''
      options kvm-amd nested=1
      options kvm-intel nested=1
    '';
  };
}

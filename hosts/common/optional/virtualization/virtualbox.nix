{ pkgs, ... }: {
  virtualization = {
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
        addNetworkInterface = true;
      };
    };
  };
}

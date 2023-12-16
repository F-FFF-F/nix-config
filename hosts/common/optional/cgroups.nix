{ pkgs, ... }: {
  systemd = {
    enableUnifiedCgroupHierarchy = true;
    enableCgroupAccounting = true;
  };
}

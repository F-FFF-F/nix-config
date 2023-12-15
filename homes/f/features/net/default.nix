{ pkgs, config, ... }: {
  imports = [
    ./browser
    ./p2p/torrent
    ./p2p/download
  ];
}
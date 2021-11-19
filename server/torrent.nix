{ config, pkgs, lib, ... }:

let
  domain = "torrent.krutonium.ca"; #idk why I need this
in {
  services.plex = {
    enable = true;
    openFirewall = true;
  };
  services.nginx = {
    virtualHosts."torrent.krutonium.ca" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://localhost:9091";
    };
  };
}
#doesn't work

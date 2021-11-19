{ config, pkgs, lib, ... }:

let
  #domain = "plex.krutonium.ca"; #idk why I need this
in {
  services.plex = {
    enable = true;
    openFirewall = true;
  };
  services.nginx = {
    virtualHosts."plex.krutonium.ca" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://localhost:32400";
    };
  };
}

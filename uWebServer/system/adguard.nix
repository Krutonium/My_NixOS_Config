{ config, pkgs, lib, ... }:

{
  services.unbound = {
    enable = false;
    resolveLocalQueries = true;
    
  };
  services.prometheus.exporters.unbound.openFirewall = true;
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    port = 4567;
  };
}
  

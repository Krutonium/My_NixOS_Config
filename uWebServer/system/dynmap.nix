{ config, pkgs, lib, ... }:

let
  #peerPort = 50023;
in {
  services.nginx = {
  enable = true;                                          # Enable Nginx
  recommendedGzipSettings = true;
  recommendedOptimisation = true;
  recommendedProxySettings = true;
  recommendedTlsSettings = true;
  virtualHosts."dynmap.krutonium.ca" = {                  # Gitea hostname
    enableACME = true;                                    # Use ACME certs
    forceSSL = true;                                      # Force SSL
    locations."/".proxyPass = "http://localhost:8123/";   # Proxy Gitea
    };
  };

  security.acme.certs = {
    "dynmap.krutonium.ca".email = "PFCKrutonium@gmail.com";
  };
  security.acme.email = "PFCKrutonium@gmail.com";
  security.acme.acceptTerms = true;
}

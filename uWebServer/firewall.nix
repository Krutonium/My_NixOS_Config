{ config, pkgs, lib, ... }:

let
  http = 80;
  https = 443;
  ssh = 22;
  minecraft = 25565;
  transmission_web = 9091;
  transmission_peers = 50023;
  plex = 32400;
  ssh_chat = 2022;
  home-assistant = 8122;
in {
  networking.firewall.allowedTCPPorts = [ http https ssh minecraft transmission_web transmission_peers plex ssh_chat home-assistant];
  networking.firewall.allowedUDPPorts = [  ];
  networking.firewall.enable = true;
  services.fail2ban.enable = true;
}

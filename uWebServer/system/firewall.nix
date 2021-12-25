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
  satisfactory_query = 15777;
  satisfactory_beacon = 15000;
  satisfactory_game = 7777;
  sambatcp1 = 445;
  sambatcp2 = 139;
  sambaudp1 = 137;
  sambaudp2 = 138;
  avahi = 631;
in {
  networking.firewall.allowedTCPPorts = [ http https ssh minecraft transmission_web transmission_peers plex ssh_chat home-assistant sambatcp1 sambatcp2 avahi 3001];
  networking.firewall.allowedUDPPorts = [ satisfactory_query satisfactory_beacon satisfactory_game sambaudp1 sambaudp2 avahi ];
  networking.firewall.enable = true;
  services.fail2ban.enable = true;
}

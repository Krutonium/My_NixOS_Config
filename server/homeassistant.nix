let
  # Track NixOS unstable via nix-channel, or replace it with something like niv at your own discretion
  # nix-channel --add http://nixos.org/channels/nixos-unstable nixos-unstable
  unstable = import <nixos-unstable> {};
in
{
  nixpkgs.overlays = [
    (self: super: {
      inherit (unstable) home-assistant;
    })
  ];

  disabledModules = [
    "services/misc/home-assistant.nix"
  ];

  imports = [
    <nixos-unstable/nixos/modules/services/misc/home-assistant.nix>
  ];
  services.home-assistant.config.http = {
    port = 8122;
    server_host = "::1";
    trusted_proxies = "::1";
    use_x_forwarded_for = true;
  };
  services.nginx = {  
    virtualHosts."homeassistant.krutonium.ca" = {
      enableACME = true;
      forceSSL = true; 
      locations."/".proxyPass = "http://localhost:8122";
      locations."/".proxyWebsockets = true;
    };
  };
}

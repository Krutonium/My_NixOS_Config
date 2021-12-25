{ config, pkgs, lib, ... }:
let
  workingdir = "/srv/Satisfactory";
  user = "krutonium";
in
{
  systemd.services.satisfactory = {
    description = "Satisfactory Game Server";
    serviceConfig = {
      Type = "simple";
      WorkingDirectory = workingdir;
      User = user;
      Restart = "on-failure";
      KillSignal = "SIGINT";
    };
    wantedBy = [ "multi-user.target" ];
    after = [ "networking.target" ];
    path = [ pkgs.steam-run-native pkgs.steamcmd ];
    script = ''
      rm -rd ${workingdir}/Server || true
      steamcmd +force_install_dir ${workingdir}/Server +login anonymous +app_update 1690800 validate +quit
      steam-run ${workingdir}/Server/FactoryServer.sh -NOSTEAM
    '';
    enable = true;
  };
}

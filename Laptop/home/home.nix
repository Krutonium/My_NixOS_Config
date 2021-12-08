{ config, pkgs, ... }:
let
  unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
  # reuse the current configuration
  {config = config.nixpkgs.config;};
 
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true; 
  targets.genericLinux.enable = true; #Fix Icons?
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "krutonium";
  home.homeDirectory = "/home/krutonium";
  home.sessionVariables.EDITOR = "nano";
  home.sessionVariables.VISUAL = "nano";
  home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  programs.bash.enable = true;

  #Install our Packages
  home.packages = [ 
    pkgs.tdesktop 
    pkgs.discord 
    pkgs.firefox 
    pkgs.wget 
    pkgs.gnome.gnome-tweaks 
    pkgs.gnomeExtensions.dash-to-panel 
    pkgs.gnomeExtensions.arcmenu 
    pkgs.arc-theme 
    pkgs.yaru-theme 
    pkgs.sweet 
    pkgs.ubuntu_font_family 
    pkgs.jetbrains.rider 
    pkgs.dotnetCorePackages.sdk_5_0 
    pkgs.mono
    pkgs.htop
    pkgs.neofetch
    pkgs.gnomeExtensions.appindicator
    pkgs.wine
    pkgs.obs-studio
    pkgs.dropbox
    pkgs.lutris
    pkgs.mangohud
    (pkgs.multimc.override { msaClientID = "81a207c0-a53c-46a3-be07-57d2b28c1643"; })
    pkgs.openjdk17
    pkgs.goverlay
    pkgs.openrct2
    pkgs.vlc
    pkgs.nanorc
    pkgs.openrgb
    pkgs.iconpack-obsidian
    pkgs.bibata-extra-cursors
    unstable.godot
    pkgs.plex-media-player
    pkgs.plexamp
    pkgs.transgui
  ];

  # Set up Dotfiles
  # Programs not explicitly supported can be done like this:
  #home.file.".nanorc".source = mkLink.to "./config/nano.cfg";
  #home.file.".config/OpenRCT2/config.ini".source = mkLink.to "./config/openrct2.conf";
  #home.file."home.nix".source = mkLink.to "./home.nix";
  #Supported Programs like this:
  programs.git = {
    enable = true;
    userName = "Krutonium";
    userEmail = "PFCKrutonium@gmail.com";
  }; 
  
  # Theme
  gtk.enable = true;
  gtk.theme.name = "Sweet-Dark";
  gtk.iconTheme.name = "Obsidian-Purple";
  #gtk.cursorTheme.name = "Bibata_Dodger_Blue";  
  #Run Scripts
  
  #What version of Home Manager this config file was created at.
  home.stateVersion = "21.05";
}

{ config, pkgs, ... }:
let
  unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
  # reuse the current configuration
  {config = config.nixpkgs.config;};
 
in
{
  imports = [
    ./dconf.nix
  ];    
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
    unstable.tdesktop 
    pkgs.discord 
    pkgs.firefox 
    pkgs.wget 
    pkgs.gnome.gnome-tweaks 
    pkgs.gnomeExtensions.dash-to-panel 
    unstable.gnomeExtensions.arcmenu 
    pkgs.arc-theme 
    pkgs.yaru-theme 
    pkgs.sweet 
    pkgs.ubuntu_font_family
    (with pkgs.dotnetCorePackages; combinePackages [
      sdk_3_1
      sdk_5_0
      sdk_6_0 
      ])
    pkgs.jetbrains.rider 
    pkgs.github-desktop
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
    pkgs.gnome.dconf-editor
    pkgs.jstest-gtk
    pkgs.quassel
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
  
  #What version of Home Manager this config file was created at.
  home.stateVersion = "21.05";
}

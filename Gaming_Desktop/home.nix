{ config, pkgs, ... }:
let
  unstable = import
  (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
  # reuse the current configuration
  {config = config.nixpkgs.config;};
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true; 
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "krutonium";
  home.homeDirectory = "/home/krutonium";
  home.sessionVariables.EDITOR = "nano";
  home.sessionVariables.VISUAL = "nano";
  home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName = "Krutonium";
    userEmail = "PFCKrutonium@gmail.com";
  };
  # 81a207c0-a53c-46a3-be07-57d2b28c1643 Microsoft Client ID for MultiMC
  #These are the packages installed in my home directory
  home.packages = [ 
    pkgs.kotatogram-desktop 
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
    unstable.goverlay
    unstable.openrct2
    pkgs.vlc
  ];
  
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}

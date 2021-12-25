# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  nixpkgs-unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
  {config = config.nixpkgs.config;};
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./firewall.nix
      ./torrent.nix
      ./gitea.nix
      ./plex.nix
      ./dynmap.nix
      ./users/resin.nix
      ./users/krutonium.nix
      ./gameservers.nix
    ];
  nixpkgs.config.allowUnfree = true;
  nix.autoOptimiseStore = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  services.xserver.videoDrivers = [ "nvidia" ];
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.tmpOnTmpfs = true;
  networking.hostName = "uWebServer"; # Define your hostname.
    
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.enp0s25.mtu=1000;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = false;


  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.xfce.enable = false;  
  services.xserver.displayManager.lightdm.enable = false;
  #services.xserver.desktopManager.gnome.enable = true;
  services.xrdp.enable = false;
  services.xrdp.defaultWindowManager = "startxfce4"; 

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
#  let  
#    nixosGodot = fetchGit {
#      url = "https://github.com/sgillespie/nixos-godot-bin.git";
#    };
#  in
#  nixpkgs.overlays = nixpkgs.overlays ++ [(import "${nixosGodot}/overlay.nix)"]

  environment.systemPackages = with pkgs; [
     wget
     nano
     htop
     neofetch
     git
     screen
     steamcmd
     nixpkgs-unstable.plex
  ];

  security.acme.email = "PFCKrutonium@gmail.com";
  security.acme.acceptTerms = true;  
  #Enable SSL^

  users.users.root = {
    hashedPassword = "*";
  };

  services.openssh.permitRootLogin = "no";
  services.samba = {
    enable = true;
    securityType = "user";
    shares = {
      media = {
        path = "/media";
        browseable = true;
        "read only" = "no";
      };
      home = {
        path = "/home/krutonium";
        browseable = true;
        "read only" = "no";
      };
      torrents = {
        path = "/transmission";
        browseable = true;
        "read only" = "no";
      };
    };
  };
  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      domain = true;
      hinfo = true;
      userServices = true;
    };
  };


  services.nginx.virtualHosts."krutonium.ca" = {
    addSSL = true;
    enableACME = true;
    root = "/var/www/home/";
    #basicAuth = { user = "password"; };
  };
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}


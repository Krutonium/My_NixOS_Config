# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
   kernel = pkgs.linuxPackages;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nix.autoOptimiseStore = true;
  time.hardwareClockInLocalTime = true;
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "27c52aa1";
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    devices = [ "nodev" ];
    efiSupport = true;
    enable = true;
    useOSProber = true;
    default = "saved";
  };
  services.quassel.enable = true; #IRC Client
  boot.kernelParams = [ "iommu=soft" ];	
  #VL805 Bug
  boot.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = kernel;
  networking.hostName = "nixos-desktop"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  systemd.enableEmergencyMode = false; # Disable Emergency Mode

  swapDevices = [{
    device = "/swap";
    size = 1024 * 8; #8GB
  }];
  
  systemd.services = {
    zfs-mount = {
      enable = false;
      restartIfChanged = false;
    };
    network-addresses-wlp4s0 = {
      enable = false;
      restartIfChanged = false;
    };
  };
  
  # Set your time zone.
  time.timeZone = "America/Toronto";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

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
  services.xserver.enable = true;
  hardware.nvidia.modesetting.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.nvidiaWayland = true;
  hardware.opengl.enable = true;
  
  #Enable nVidia with AMD as Primary
  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.extraModulePackages = [ kernel.nvidia_x11 ];
  boot.blacklistedKernelModules =  [ "nouveau" "nvidia_drm" "nvidia_modeset" ]; #nvidia	

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.chrome-gnome-shell.enable = true; #Figure out how to move this to home-manager  
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krutonium = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    chrome-gnome-shell
    linuxPackages.nvidia_x11
    home-manager
    zfs
  ];
  programs.steam.enable = true;
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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


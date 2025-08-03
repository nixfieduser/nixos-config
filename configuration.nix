{ config, inputs, pkgs, lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules.nix
    ];


  boot = {

    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_zen;
    #kernelPackages = pkgs.linuxPackages_cachyos;
    #kernelPackages = pkgs.linuxPackages_cachyos-lto;

    kernel.sysctl = {
            "vm.swappiness" = 15;
            "vm.max_map_count" = 2147483642;
            };

  };

 # programs.cfs-zen-tweaks.enable = true;


  networking.hostName = "hal9000"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable sound with pipewire.
  #security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nix.settings = {

    experimental-features = [ "nix-command" "flakes" ];
    #trusted-substituters = [ "https://cache.flox.dev" ];
    #trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];

    substituters = [];
    trusted-public-keys = [ ];

  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hal9000 = {
    isNormalUser = true;
    description = "Hal9000";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "input"  ];

  };





  environment.variables = {

    MOZ_ENABLE_WAYLAND= "1"; # Launch Firefox under XWayland
    #QT_QPA_PLATFORMTHEME = "qt6ct";
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    GST_PLUGIN_SYSTEM_PATH_1_0 = "/run/current-system/sw/lib/gstreamer-1.0/";
    
  };


  #Fix Electron applications defaulting to X11 rather than Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.envfs.enable = true;



  #services.touchegg.enable = true;

  security.polkit.enable = true; #required by swaywm


  fonts.fontDir.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  nix.settings.auto-optimise-store = true;
  programs.dconf.enable = true;
  programs.gamescope.enable = true;
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;
  programs.ydotool.enable = true;
  services.ananicy.enable = true;
  services.flatpak.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
};

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
};

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };



  system.stateVersion = "24.11"; # Did you read the comment?

}

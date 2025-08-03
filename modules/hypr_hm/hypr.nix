{config, inputs, pkgs, lib, ...}:
{



  programs = {
    hyprland.enable = true;
    hyprland.withUWSM = true;
    hyprlock.enable = true;
    #rofi-wayland.enable = true;

  };


  users.users.hal9000.packages = with pkgs; [

    hyprpanel
    playerctl
    iwmenu
    bzmenu
    hyprsunset
    matugen
    swww
    waypaper





  ];


  # Portals
    xdg.portal = {
      config = {
        hyprland.default = [ "hyprland" "gtk" "gnome" "termfilechooser" ];
        hyprland."org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
        hyprland."org.freedesktop.portal.OpenURI" = [ "termfilechooser" ];
      };

      extraPortals = with pkgs; [
        pkgs.xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
      ];
    };




  }

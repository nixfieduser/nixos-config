{config, inputs, pkgs, lib, ...}:
{

  services ={
    xserver.enable = true;

    desktopManager.plasma6.enable = true;

    displayManager = {
        sddm.enable = true;
        #defaultSession = "plasmax11";
        sddm.wayland.enable = true;
        autoLogin = {
            enable = false;
            user = "hal9000";
        };
    };
  };


  # Portals
    xdg.portal = {
      config = {
        kde.default = [ "kde" "gtk" "gnome" ];
        kde."org.freedesktop.portal.FileChooser" = [ "kde" ];
        kde."org.freedesktop.portal.OpenURI" = [ "kde" ];
      };

      extraPortals = with pkgs.kdePackages; [
        xdg-desktop-portal-kde
      ];
    };



}

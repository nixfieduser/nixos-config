{ pkgs, ...}:
{
  imports = [
    #<plasma-manager/modules>
    ./shortcuts.nix
    ./rules.nix
  ];

  programs = {
    plasma = {
      enable = true;
      workspace = {
        #wallpaperFillMode = "preserveAspectCrop";
        clickItemTo = "open"; #single click option or "select"

      };

      kwin = {
        virtualDesktops = {
          number = 8;
          rows = 1;
        };
      };

      powerdevil = {
        Ac = {
          autosuspend = "nothing";
          dimDisplay.enable = false;
          powerButtonAction = "showLogoutScreen";
          powerprofile = "performance";
          whenLaptopLidClosed = "sleep";
          turnOffDisplay.idleTimeout = "never";
        };

        battery = {
          autosuspend.action = "sleep";
          autosuspend.idleTimeout = 1800;
          powerButtonAction = "showLogoutScreen";
          whenLaptopLidClosed = "sleep";
          dimDisplay = {
            enable = true;
            idleTimeout = 120;
          };
        };

      };

    };
  };
}

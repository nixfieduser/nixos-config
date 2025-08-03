{config, inputs, pkgs, lib, ...}:
{

 wayland.windowManager.hyprland.enable = true;

  imports = [
    ./keybindings.nix
    #./fonts.nix
    ./hyprpanel.nix
  ];

 wayland.windowManager.hyprland.settings = {
   exec-once = [
      "hyprpanel"
      "swww-daemon"
       ];




    bezier = "easeInOutQuad, 0.45, 0, 0.55, 1";
    animation = [
      "workspaces, off"
      "windowsMove, 1, 2, easeInOutQuad, slide"
      ];

  # change monitor to high resolution, the last argument is the scale factor
    monitor = ", highres, auto, 1.5";

    # unscale XWayland
    xwayland = {
      force_zero_scaling = true;
    };


  };




}




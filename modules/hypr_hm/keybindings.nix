{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {

       input = {
      kb_layout = "br";

      #kb_options = "caps:escape";
      follow_mouse = 1; };

      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";


    bindr = "SUPER, SUPER_L, exec, pkill rofi || rofi -show combi"; # Launcher


    bind = [
      "$mod,RETURN, exec, uwsm app -- ${pkgs.kitty}/bin/kitty" # Kitty
      "$mod,ESC, exec,  uwsm app -- ${pkgs.btop}/bin/btop" # Btop
      "$mod,B, exec,  uwsm app -- firefox"
      "$mod,V, exec,  uwsm app -- ${pkgs.vim}/bin/vim" # Vim
      "$shiftMod,L, exec,  uwsm app -- ${pkgs.hyprlock}/bin/hyprlock" # Lock
      "$mod,X, exec, uwsm app -- ${pkgs.wofi-power-menu}/bin/wofi-power-menu" # Powermenu

      "$mod,C, exec, quickmenu" # Quickmenu
      "$shiftMod,SPACE, exec, hyprfocus-toggle" # Toggle HyprFocus
      # "$mod,P, exec,  uwsm app -- ${pkgs.planify}/bin/io.github.alainm23.planify" # Planify

      "$mod,Q, killactive," # Close window
      "$mod,T, togglefloating," # Toggle Floating
      "$mod,F, fullscreen, 1" # Toggle Fullscreen
      "$mod, O, cyclenext, prev"
      "$mod, P, cyclenext"
      "$mod,h, movefocus, l" # Move focus left
      "$mod,l, movefocus, r" # Move focus Right
      "$mod,j, movefocus, u" # Move focus Up
      "$mod,k, movefocus, d" # Move focus Down
      "$Alt_L, H, swapwindow, l"
      "$Alt_L, L,swapwindow, r"
      "$Alt_L, J,swapwindow, u"
      "$Alt_L, K,swapwindow, d"

      "$mod, W, exec, overview:toggle" #toggle hyprspaces


      "$mod,PRINT, exec, screenshot region" # Screenshot region
      ",PRINT, exec, screenshot monitor" # Screenshot monitor
      "$shiftMod,PRINT, exec, screenshot window" # Screenshot window
      "ALT,PRINT, exec, screenshot region swappy" # Screenshot region then edit

      "$shiftMod,T, exec, hyprpanel-toggle" # Toggle hyprpanel
      "$shiftMod,C, exec, clipboard" # Clipboard picker with wofi
      "$shiftMod,E, exec, ${pkgs.wofi-emoji}/bin/wofi-emoji" # Emoji picker with wofi
      "$mod,F2, exec, night-shift" # Toggle night shift
      "$mod,F3, exec, night-shift" # Toggle night shift
    ] ++ (builtins.concatLists (builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod,code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) 9));

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,R, resizewindow" # Resize Window (mouse)
    ];

    bindl = [
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
    ];

    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ",XF86MonBlnessUp, exec, blness-up" # Blness Up
      ",XF86MonBlnessDown, exec, blness-down" # Blness Down
    ];

  };
}

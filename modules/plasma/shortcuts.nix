{ pkgs, ...}:
{


  programs = {
    plasma = {
        shortcuts = {
            "kwin"."KrohnkiteFocusDown" = "Meta+K,none,Krohnkite: Focus Down";
            "kwin"."KrohnkiteFocusLeft" = "Meta+H,none,Krohnkite: Focus Left";
            "kwin"."KrohnkiteFocusRight" = "Meta+L,none,Krohnkite: Focus Right";
            "kwin"."KrohnkiteFocusUp" = "Meta+J,none,Krohnkite: Focus Up";
            "kwin"."KrohnkiteMonocleLayout" = "Meta+M,none,Krohnkite: Monocle Layout";
            "kwin"."KrohnkiteShiftDown" = "Meta+Shift+K,none,Krohnkite: Move Down/Next";
            "kwin"."KrohnkiteShiftLeft" = "Meta+Shift+H,none,Krohnkite: Move Left";
            "kwin"."KrohnkiteShiftRight" = "Meta+Shift+L,none,Krohnkite: Move Right";
            "kwin"."KrohnkiteShiftUp" = "Meta+Shift+J,none,Krohnkite: Move Up/Prev";
            "kwin"."KrohnkiteSpiralLayout" = "Meta+S,none,Krohnkite: Spiral Layout";
            "kwin"."KrohnkiteToggleFloat" = "Meta+F,none,Krohnkite: Toggle Float";

            "services/kitty.desktop"."_launch" = "Meta+T";
            "yakuake"."toggle-window-state" = "F12";
            "ksmserver"."Lock Session" = ["Alt+L" "Screensaver,Lock Session"];


            "kwin"."Window to Desktop 1" = "Alt+!,,Window to Desktop 1";
            "kwin"."Window to Desktop 2" = "Alt+@,,Window to Desktop 2";
            "kwin"."Window to Desktop 3" = "Alt+#,,Window to Desktop 3";
            "kwin"."Window to Desktop 4" = "Alt+$,,Window to Desktop 4";
            "kwin"."Window to Desktop 5" = "Alt+%,,Window to Desktop 5";
            "kwin"."Window to Desktop 6" = "Alt+ោ,,Window to Desktop 6";
            "kwin"."Window to Desktop 7" = "Alt+&,,Window to Desktop 7";
            "kwin"."Window to Desktop 8" = "Alt+*,,Window to Desktop 8";
            "kwin"."Window to Desktop 9" = "Alt+(,,Window to Desktop 9";

            "kwin"."Switch to Desktop 1" = "Alt+1,,Switch to Desktop 1";
            "kwin"."Switch to Desktop 2" = "Alt+2,,Switch to Desktop 2";
            "kwin"."Switch to Desktop 3" = "Alt+3,,Switch to Desktop 3";
            "kwin"."Switch to Desktop 4" = "Alt+4,,Switch to Desktop 4";
            "kwin"."Switch to Desktop 5" = "Alt+5,,Switch to Desktop 5";
            "kwin"."Switch to Desktop 6" = "Alt+6,,Switch to Desktop 6";
            "kwin"."Switch to Desktop 7" = "Alt+7,,Switch to Desktop 7";
            "kwin"."Switch to Desktop 8" = "Alt+8,,Switch to Desktop 8";
            "kwin"."Switch to Desktop 9" = "Alt+9,,Switch to Desktop 9";
        };
    };
  };
}

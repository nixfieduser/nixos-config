## NixOS Configuration files

This setup is managed by `Flakes` and `Home Manager`. Currently it is missing a more personalized Hyprland session, it is only kept as a reference point for further customization.

The Plasma session is functional. However, it isn't completely declarative as neither the default Nix nor Home Manager offers a fully scriptable Plasma environment. 

> **Note**:  These configuration files are primarily my backup solution, there isn't any activation or first-time run scripts enabled yet.  Change **hostname** and other parameters according to your preferences. 

---

**To-do:**

- Create conditional statements in order to enable Plasma, Hyprland and other modules;
- Increase the usage of [**plasma-manager**](https://github.com/nix-community/plasma-manager) to automatically configure panel and widgets layout;
- Improve and customize the Hyprland session, including Waybar or other Wayland bar program;
- Rewrite the flake.nix file and move  **devshells** into separate configs.



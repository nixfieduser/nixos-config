{ config, pkgs, inputs,lib, ... }:

{
  home.username = "hal9000";
  home.homeDirectory = "/home/hal9000";

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";



  imports = [
    ./modules/kitty.nix
    ./modules/hypr_hm/hypr_hm.nix
    ./modules/yazi.nix
    ./modules/hypr_hm/rofi/rofi.nix
    #./modules/hypr_hm/fonts_hm.nix
  ];

  


  
}




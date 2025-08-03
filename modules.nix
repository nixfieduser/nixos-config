{ config, inputs, pkgs, lib,... }:
{
imports = [
    #./modules/cosmic.nix
    #./modules/firefox.nix
    ./modules/flatpak.nix
    ./modules/fonts.nix
    ./modules/hypr_hm/hypr.nix
    ./modules/nix-ld.nix
    ./modules/nvidia.nix
    ./modules/pkgs.nix
    ./modules/plasma/plasma.nix
    ./modules/virtmanager.nix
    ./modules/zsh.nix
];
}

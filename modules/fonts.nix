{configs, packages,pkgs, ... }:
{

  #fonts.fontconfig.useEmbeddedBitmaps = true;


  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-color-emoji
    #texlivePackages.jetbrainsmono-otf
    unicode-emoji
    corefonts
    symbola
    ubuntu_font_family
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    cantarell-fonts
    inter
    ];

}

{ config, inputs, pkgs, lib,... }:
{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  users.users.hal9000.packages = with pkgs; [

      #adwaita-icon-theme
      anytype
      bottles
      brave
      heroic
      boxbuddy
      digikam
      distrobox
      firefox
      gimp3-with-plugins
      gnugo
      haruna
      krita
      libreoffice-fresh
      libadwaita
      lmstudio
      lutris
      media-downloader
      mediawriter
      obsidian
      onlyoffice-bin_latest
      papirus-icon-theme
      peazip
      plasma-panel-colorizer
      prismlauncher
      qalculate-gtk
      qbittorrent
      qmplay2-qt5
      teams-for-linux
      telegram-desktop
      texliveFull
      vdhcoapp
      vesktop
      ventoy-full
      waveterm
      wineWowPackages.unstableFull
      winetricks

      #       (cairo.override {
#         gobjectSupport = true;
#         xcbSupport = true;
#       })

]

  #KDE suite
  ++( with kdePackages; [

      qtstyleplugin-kvantum
      qtmultimedia
      qtwebengine
      discover
      #neochat
      yakuake
      kigo
      ksudoku
      kate
      qtwebsockets
      krohnkite

        ] )

    #devtools and cli apps
    ++([
      wezterm
	
      python313Full
      python313Packages.pipx
      python313Packages.pyatspi
      libgcc
      glibc
      libcxx
      cmake
      gnumake
      gcc
      gccStdenv
      gcc14Stdenv
      #gtkdialog
      toybox # required for unix2dos
      dosbox-x
      #gnucobol
      vim
      vscode-fhs
      zed-editor
      neovim-qt
      lunarvim
      git
      github-desktop
      rar
      vulkan-tools
      fastfetch
      exiftool
      


    ])

    #Non-nixpkgs repo
    ++([

      #(callPackage ./pkgs/audiotube.nix {})
      #inputs.lightly.packages.${pkgs.system}.darkly-qt5
      #inputs.lightly.packages.${pkgs.system}.darkly-qt6
      nur.repos.shadowrz.klassy-qt6
      nur.repos.xddxdd.plasma-smart-video-wallpaper-reborn

    ]);



  nixpkgs.config.permittedInsecurePackages = [
      "ventoy-1.1.05"
                ];


  environment.systemPackages = with pkgs; [
    ];


    nixpkgs.overlays = [
      (final: prev: {
        plasma-panel-colorizer = prev.plasma-panel-colorizer.overrideAttrs {
          postInstall = "chmod 755 $out/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/list_presets.sh";
        };
      })
    ];

}

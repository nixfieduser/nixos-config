 { config, inputs, pkgs, lib,... }:{


 services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub";  }
    "com.rtosta.zapzap"
    "com.stremio.Stremio"
    "com.vysp3r.ProtonPlus"
    "org.kde.audiotube"
    "org.kde.kasts"
  ];

}

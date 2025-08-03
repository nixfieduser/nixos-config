{config, inputs, pkgs, lib,...}:
{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    #LD_DEBUG=libs List required libraries when runnning a shell script

    stdenv.cc.cc
    libgcc
    cmake
    kdePackages.extra-cmake-modules
    extra-cmake-modules
    gcc
    glibc
    libcxx
    gccStdenv
    gcc14Stdenv
    python313Full
    python313Packages.pydbus
    python313Packages.dbus-python
    python313Packages.pygobject3
    gobject-introspection
    gettext
    #gtkdialog

  ];

}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    umu.url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";
    lightly.url = "github:Bali10050/Darkly";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };


  };

  outputs = { self, nixpkgs, nixpkgs-stable, chaotic, nur, home-manager, plasma-manager, nix-flatpak,... }@inputs:
    let
      system = "x86_64-linux";



      #Shared overlay for stable packages
      overlay-stable = final: prev: {
        stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };



      # Shared pkgs for general usage outside Modules, such as in devShells
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay-stable  ]; #optional
      };

      # Customized umu package
      umu = inputs.umu.packages.${system}.umu.override {
        withTruststore = true;
        withDeltaUpdates = true;
      };

    in {
      nixosConfigurations.hal9000 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [ overlay-stable  nur.overlays.default ];
            environment.systemPackages = with pkgs; [
              umu-launcher
            ];
          })
          ./configuration.nix
          chaotic.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup"; # Set backup file extension
            home-manager.users.hal9000 = ./home.nix;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];


            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

          {
          nix.settings = {
              #substituters = [ "https://cosmic.cachix.org/" ];
              #trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }


        ];
      };

      # Define devShells directly, reusing pkgs
      # To enter:  nix develop .#hints-python
      devShells = {
        # Instead of x86_64-linux = {}; there is ${system} = {};
        x86_64-linux = {
            compiling = pkgs.mkShell {
            packages = with pkgs; [
                python313Full
                python313Packages.pipx
                python313Packages.pkgconfig
                python313Packages.pyatspi
                python313Packages.evdev
                python313Packages.libevdev
                pkg-config
                (pkgs.cairo.override {
                gobjectSupport = true;
                xcbSupport = true;
                })
                python313Packages.pycairo
                python313Packages.pydbus
                python313Packages.dbus-python
                python313Packages.pygobject3
                gobject-introspection
                #stdenv.cc.cc
                gcc13Stdenv
                #libgcc
                cmake
                kdePackages.extra-cmake-modules
                kdePackages.libplasma
                kdePackages.appstream-qt
                extra-cmake-modules
                #gcc
                #gcc_multi
                gcc13
                #tests-stdenv-gcc-stageCompare
                binutils
                #glibc
                #libcxx
                #gccStdenv
                #gcc14Stdenv
                kdePackages.qtbase
                kdePackages.full
                kdePackages.qtdeclarative

            ];
            shellHook = "


              ";
            };

            jekyll = pkgs.mkShell{
              packages = with pkgs; [
                ruby
                rubyPackages.jekyll
                rubyPackages.webrick
                rubyPackages.jekyll-seo-tag
                rubyPackages.jekyll-sitemap
                rubyPackages.jekyll-gist
                rubyPackages_3_4.rake
                jekyll
                bundler
              ];



            };


        };


      };
    };
}

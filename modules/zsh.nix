{config, inputs, pkgs, lib, ...}:
{

 users.defaultUserShell = pkgs.zsh;

 programs.zsh = {
	enable = true;
	autosuggestions.enable = true;
	syntaxHighlighting.enable = true;
	ohMyZsh = {
	 	enable = true;
		theme = "jonathan";
		};
	shellAliases = {
		upgrade-now="nix flake update --flake ~/etc/nixos && sudo nixos-rebuild switch --max-jobs 4 --cores 4";
		upgrade-later="nix flake update --flake ~/etc/nixos && sudo nixos-rebuild boot --max-jobs 4 --cores 4";
		};

	};
# Prevent the new user dialog in zsh
system.userActivationScripts.zshrc = "touch .zshrc";


}


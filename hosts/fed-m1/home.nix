{ config, pkgs, inputs, ... }:

{
	imports = [
		../../modules/shared/shell.nix
		../../modules/shared/firefox.nix
		../../modules/shared/theme.nix
		../../modules/wayland/desktop.nix
	]; 

	##############################
	# nix stuff
	##############################

	nix.package = pkgs.nix;
	nix.gc = {
		automatic = true; 
		dates = "weekly"; 
		options = "--delete-older-than 7d";
	};

	##############################
	# home-manager stuff
	##############################

	home.username = "tsyr";
	home.homeDirectory = "/home/tsyr";

	home.stateVersion = "26.05"; # Version of home-manager, don't change. 

	home.sessionVariables = {
	        # EDITOR = "emacsclient";
	        GDK_DEBUG = "no-pixel-cache";
	};
	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

	##############################
	# pwndbg
	##############################

  home.packages = with pkgs; [
        inputs.pwndbg.packages."aarch64-linux".default
        caido-desktop
        chromium
        texlive.combined.scheme-medium
    ];
    }


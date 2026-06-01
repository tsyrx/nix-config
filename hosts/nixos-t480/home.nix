{ config, pkgs, ... }:

{
	imports = [
		./modules/shell.nix
		./modules/desktop.nix
		./modules/theme.nix
	]; 

	##############################
	# home-manager stuff
	##############################

	home.username = "tsyr";
	home.homeDirectory = "/home/tsyr";

	home.stateVersion = "26.05"; # Version of home-manager, don't change. 

	home.sessionVariables = {
# EDITOR = "emacs";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}


{ config, pkgs, ... }:

{
	imports = [
		../../modules/shared/shell.nix
		../../modules/shared/theme.nix
		../../modules/wayland/desktop.nix
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

	home.packages = with pkgs; [
		firefox 
	]; 
}


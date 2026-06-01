{ config, pkgs, ... }:

{
	nixpkgs.config = {
		allowUnfree = true; 
		allowUnfreePredicate = (_: true); 
	}; 

	gtk = {
		enable = true; 
		theme = {
			name = "Graphite-Dark"; 
			package = pkgs.graphite-gtk-theme.override {
				tweaks = [ "black" ]; 
				colorVariants = [ "dark" ]; 
			}; 
		};
		iconTheme = {
			name = "Papirus-Dark"; 
			package = pkgs.papirus-icon-theme; 
		}; 
		font = {
			name = "IBM Plex Sans"; 
			size = 9; 
		};
	};

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark"; 
		};
	};

	home.pointerCursor = {
		name = "DMZ-Black"; 
		package = pkgs.vanilla-dmz; 
		size = 24; 
		gtk.enable = true; 
		x11.enable = true; 
	}; 
}

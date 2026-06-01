{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		brightnessctl
		wofi
		i3status
	];

	home.file = {
		".config/sway/config".source = ../../configs/sway-config;
		".config/i3status/i3status.conf".source = ../../configs/sway-i3-status;
	};

	programs.swaylock = {
		enable = true; 

		settings = {
			image = "/home/tsyr/Pictures/backgrounds/feedbacker-bw-inv.png";
			indicator = true; 

			inside-color = "00000000";
			ring-color = "ff0000bb";
			line-color = "00000000";

			inside-ver-color = "ff0000bb";
			ring-ver-color = "42383788";

			inside-wrong-color = "ffffffff";
			ring-wrong-color = "ffffffff";

			separator-color = "ff0000bb";

			text-color = "ffffff00";
			text-ver-color = "ffffff00";
			text-wrong-color = "ffffff00";

			key-hl-color = "ffffffff";
			bs-hl-color = "ffffffff";
		}; 
	}; 

	services.swayidle = {
		enable = true; 
		events = [
			{ event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f"; }
		]; 
		timeouts = [
			{
				timeout = 300; 
				command = "${pkgs.swaylock}/bin/swaylock -f";
			}

			{
				timeout = 360; 
				command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
				resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
			}
		];
	};
}

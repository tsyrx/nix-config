{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		brightnessctl
		dmenu
		feh
		i3status
		i3lock-color
	];

	home.file = {
		".config/i3/config".source = ../../configs/i3-config;
		".config/i3status/i3status.conf".source = ../../configs/i3-status;
	};

	services.picom = {
		enable = true; 
		vSync = true; 
		backend = "glx"; 

		shadow = false; 
		fade = false; 
	};

	services.screen-locker = let 
		BLANK="#00000000";
		CLEAR="#ffffffff";
		DEFAULT="#ff0000bb";
		TEXT="#ffffff00";
		WRONG="#ffffffff";
		VERIFYING="#42393788";
	in {
		enable = true; 
		lockCmd = "${pkgs.i3lock-color}/bin/i3lock  " +
		"--insidever-color=${DEFAULT} " +
		"--ringver-color=${VERIFYING} " +
		"--insidewrong-color=${CLEAR} " +
		"--ringwrong-color=${WRONG} " +
		"--inside-color=${BLANK} " +
		"--ring-color=${DEFAULT} " +
		"--line-color=${BLANK} " +
		"--separator-color=${DEFAULT} " +
		"--verif-color=${TEXT} " +
		"--wrong-color=${TEXT} " +
		"--time-color=${TEXT} " +
		"--date-color=${TEXT} " +
		"--layout-color=${TEXT} " +
		"--keyhl-color=${WRONG} " +
		"--bshl-color=${WRONG} " +
		"--screen 1 " +
		"--blur 5 " +
		"--indicator -i /home/tsyr/Pictures/backgrounds/feedbacker-bw-inv.png";
		inactiveInterval = 5; 
	}; 
}

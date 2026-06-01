# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
	imports =
		[ 
		./hardware-configuration.nix
		];

	######################################
	# nix settings 
	######################################

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.auto-optimise-store = true;
	nix.gc = {
		automatic = true; 
		dates = "weekly"; 
		options = "--delete-older-than 7d";
	};

	######################################
	# pwn
	######################################

	programs.nix-ld.enable = true; 

	######################################
	# bootloader 
	######################################

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	######################################
	# networking 
	######################################

	networking.hostName = "buka"; 
	networking.networkmanager.enable = true;

	services.tailscale.enable = true;

	######################################
	# users 
	######################################

	users.users.tsyr = {
		isNormalUser = true;
		home = "/home/tsyr";
		shell = pkgs.zsh;
		extraGroups = [ 
			"wheel" 
			"networkmanager"

		];
	};

	######################################
	# x server & lightdm
	######################################

	services.xserver.enable = true;
	services.xserver.windowManager.i3.enable = true;
	services.xserver.displayManager.lightdm = {
		enable = true; 
		background = "#000000";

		greeters.gtk = {
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

			extraConfig = '' 
				hide-user-image=true
			''; 
		};
	}; 

	######################################
	# fix fucked up keys
	######################################

	services.keyd = {
		enable = true;
		keyboards = {
			default = {
				ids = [ "*" ];
				settings = {
					main = {
						capslock = "layer(control)";
						"102nd" = "semicolon";
					};
				};    
			};
		}; 
	};

	######################################
	# audio & input
	######################################

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	services.libinput.enable = true;

	######################################
	# system-wide packages 
	######################################

	environment.systemPackages = with pkgs; [
		vim 

		pciutils
		usbutils
		lshw

		dnsutils
		tcpdump
	];

	
	######################################
	# general stuff
	######################################

	time.timeZone = "Europe/Lisbon";

	programs.zsh.enable = true;
	programs.dconf.enable = true;

	system.stateVersion = "26.05"; # Did you read the comment?
}


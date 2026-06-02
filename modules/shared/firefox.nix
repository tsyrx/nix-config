{ config, pkgs, ... }:

{
	programs.firefox = {
		enable = true; 

		policies = {
			ExtensionSetings = {
				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
				};
				"tridactyl.vim@cmcaine.co.uk" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
					installation_mode = "force_installed";
				};
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
					installation_mode = "force_installed";
				};
				"{9b84b6b4-07c4-4b4b-ba21-394d86f6e9ee}" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/black21/latest.xpi";
					installation_mode = "force_installed";
				};
			};
		};
	};
}

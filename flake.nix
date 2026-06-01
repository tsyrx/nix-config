{
	description = "Fred Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }: {
		homeConfigurations = {
			"tsyr@fred" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."aarch64-linux"; 

				modules = [ 
					./hosts/fed-m1/home.nix 
				];
			};
		};
	};
}

{
	description = "Fred Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
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

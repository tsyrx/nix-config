{
	description = "Fred Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }: {
		homeConfigurations = {
			"tsyr@fred" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."aarch64-linux"; 
				extraSpecialArgs = {
					pkgs-stable = nixpkgs-stable.legacyPackages."aarch64-linux";
				};

				modules = [ 
					./hosts/fed-m1/home.nix 
				];
			};
		};
	};
}

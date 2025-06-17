{
  description = "Nixos config flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, home-manager, nixpkgs, nvf, ... }@inputs: {
    nixosConfigurations = {
      hawkeye = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hawkeye/configuration.nix
          home-manager.nixosModules.default
          nvf.nixosModules.default
        ];
      };

      radar = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/radar/configuration.nix
          home-manager.nixosModules.default
          nvf.nixosModules.default
        ];
      };

      # add configurations for other hosts...
    };
  };
}

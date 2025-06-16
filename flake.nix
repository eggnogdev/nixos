{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: {
    nixosConfigurations = {
      hawkeye = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hawkeye/configuration.nix
          nvf.nixosModules.default
        ];
      };

      radar = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/radar/configuration.nix
          nvf.nixosModules.default
        ];
      };

      # add configurations for other hosts...
    };
  };
}

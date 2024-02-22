{
  # Welcome to eggnogOS!
  # 
  # This is the configuration for my "multi" user system "multi" in quotes
  # because I like to segment stuff like school and personal into different 
  # users
  description = "eggnogOS";

  inputs = {
    # use the stable branch
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # use the unstable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager for handling non system-wide configurations
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # My NixOS configurations
      #
      # these can be used for configuring differents hosts. for example I could
      # add in a definition for `nixosConfigurations.homelab` if I would like my
      # homelab to pick and choose a different set of modules
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}

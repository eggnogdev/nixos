{
  # Welcome to eggnogOS!
  # 
  # This is the configuration for my "multi" user system "multi" in quotes
  # because I like to segment stuff like school and personal into different 
  # users
  description = "eggnogOS";

  inputs = {
    #use the stable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home manager for handling non system-wide configurations
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
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
      # import the system wide modules
      # 
      # modules here can be accessed by `outputs.nixosModules`
      nixosModules = import ./modules/nixos;

      # import the home/user specific modules
      # 
      # modules here can be accessed by `outputs.homeModules`
      homeModules = import ./modules/home;

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

      # My home configurations
      #
      # to add another user, simply create a <name>-home.nix file for them in
      # the ./home directory which will define all packages and modules 
      # necessary for that specific user. Create a new entry to this 
      # `homeConfigurations` definition just like the others to add your new
      # user to the system
      homeConfigurations = {
        "eggnog" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/eggnog-home.nix
          ];
        };
        "student" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/student-home.nix
          ];
        };
      };
    };
}

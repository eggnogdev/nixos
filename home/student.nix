{ pkgs, nixpkgs, ... }:

{
  imports = [
    ../modules/home/vscodium.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "student";
  home.homeDirectory = "/home/student";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    sublime-merge
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.git = {
    enable = true;
    userName = "eggnog";
    userEmail = "git.1t3t3@eggnog.dev";
  };

  programs.vscodium.enable = true;

  programs.home-manager.enable = true;
}

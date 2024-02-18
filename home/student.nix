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
    userName = "AE3336";
    userEmail = "AE3336@student.jamk.fi";
  };

  programs.vscodium.enable = true;

  programs.home-manager.enable = true;
}

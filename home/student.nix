{ nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "student";
  home.homeDirectory = "/home/student";

  home.stateVersion = "23.11";

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs.git = {
    enable = true;
    userName = "AE3336";
    userEmail = "AE3336@student.jamk.fi";
  };

  programs.home-manager.enable = true;
}

{ pkgs, nixpkgs, ... }:

{
  imports = [
    ../modules/home/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "student";
  home.homeDirectory = "/home/student";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    chromium
    sublime-merge
    yed
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.git = {
    enable = true;
    userName = "eggnog";
    userEmail = "git.1t3t3@eggnog.dev";
  };

  programs.vscodium.enable = true;
  # programs.sublime.enable = true;

  programs.home-manager.enable = true;
}

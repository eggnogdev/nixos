{ pkgs, nixpkgs, ... }:

{
  imports = [
    ../modules/home/default.nix
  ];

  nixpkgs.config.allowUnfree = true;
  
  home.username = "eggnog";
  home.homeDirectory = "/home/eggnog";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    discord
    osu-lazer-bin
    prismlauncher
    signal-desktop
    steam
    sublime-merge
    thunderbird
    tor-browser
    woeusb # create bootable USB disks from Windows ISO images
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.git = {
    enable = true;
    userName = "eggnog";
    userEmail = "git.1t3t3@eggnog.dev";
  };

  programs.vscodium.enable = true;

  # sublime text seems to cause errors... 
  # programs.sublime.enable = true;

  services.protonmail-bridge = {
    enable = false;
    nonInteractive = true;
  };

  programs.home-manager.enable = true;
}

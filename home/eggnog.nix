{ pkgs, nixpkgs, ... }:

{
  imports = [
    ../modules/home/protonmail-bridge.nix
    ../modules/home/vscodium.nix
  ];

  nixpkgs.config.allowUnfree = true;
  
  home.username = "eggnog";
  home.homeDirectory = "/home/eggnog";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    hello
    discord
    prismlauncher
    signal-desktop
    steam
    sublime-merge
    thunderbird
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

  services.protonmail-bridge = {
    enable = false;
    nonInteractive = true;
  };

  programs.home-manager.enable = true;
}

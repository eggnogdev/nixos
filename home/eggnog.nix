{ outputs, config, pkgs, nixpkgs, ... }:

{
  imports = [
    ../modules/home/protonmail-bridge.nix
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      dart-code.dart-code
      dart-code.flutter
      pkief.material-product-icons
      ms-python.python
      rust-lang.rust-analyzer
    ];
  };

  services.protonmail-bridge = {
    enable = false;
    nonInteractive = true;
  };

  programs.home-manager.enable = true;
}

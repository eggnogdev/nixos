{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  programs.developer = {
    alacritty.enable = true;
  };

  home.stateVersion = "23.11";
}

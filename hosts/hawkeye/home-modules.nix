{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.stateVersion = "23.11";
}

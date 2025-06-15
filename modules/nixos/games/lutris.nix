{ config, lib, pkgs, ... }:

let
  cfg = config.programs.games.lutris;
in
{
  options = {
    programs.games.lutris = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Lutris";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris
    ];

    programs.gamemode.enable = true;
  };
}

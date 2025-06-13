{ config, lib, pkgs, ... }:

let
  cfg = config.programs.games.heroic;
in
{
  options = {
    programs.games.heroic = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Heroic";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      heroic
    ];

    programs.gamemode.enable = true;
  };
}

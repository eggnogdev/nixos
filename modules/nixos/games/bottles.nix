{ config, lib, pkgs, ... }:

let
  cfg = config.programs.games.bottles;
in
{
  options = {
    programs.games.bottles = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Bottles";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bottles
    ];

    programs.gamemode.enable = true;
  };
}

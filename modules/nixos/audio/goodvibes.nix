{ config, lib, pkgs, ... }:

let
  # Goodvibes radio player
  cfg = config.programs.audio.goodvibes;
in
{
  options = {
    programs.audio.goodvibes = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Goodvibes";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      goodvibes
    ];
  };
}

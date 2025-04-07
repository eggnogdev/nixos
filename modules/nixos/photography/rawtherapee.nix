{ config, lib, pkgs, ... }:

let
  cfg = config.programs.photography.rawtherapee;
in
{
  options = {
    programs.photography.rawtherapee = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable RawTherapee";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rawtherapee
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.design.rawtherapee;
in
{
  options = {
    programs.design.rawtherapee = {
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

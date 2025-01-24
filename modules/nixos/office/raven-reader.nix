{ config, lib, pkgs, ... }:

let
  cfg = config.programs.office.raven-reader;
in
{
  options = {
    programs.office.raven-reader = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Raven Reader";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raven-reader
    ];
  };
}

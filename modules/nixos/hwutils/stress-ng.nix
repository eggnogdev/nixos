{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.stress-ng;
in
{
  options = {
    programs.hwutils.stress-ng = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable stress-ng";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      stress-ng
    ];
  };
}

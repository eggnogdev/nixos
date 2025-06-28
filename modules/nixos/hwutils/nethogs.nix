{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.nethogs;
in
{
  options = {
    programs.hwutils.nethogs = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable nethogs";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nethogs
    ];
  };
}

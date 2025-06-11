{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.openrgb;
in
{
  options = {
    programs.utils.openrgb = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable OpenRGB";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      openrgb
    ];
  };
}

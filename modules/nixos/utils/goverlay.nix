{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.goverlay;
in
{
  options = {
    programs.utils.goverlay = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable GOverlay";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      goverlay
    ];
  };
}

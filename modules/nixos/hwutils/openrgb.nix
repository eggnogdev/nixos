{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.openrgb;
in
{
  options = {
    programs.hwutils.openrgb = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable OpenRGB";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.hardware.openrgb = { 
      enable = true; 
      package = pkgs.openrgb-with-all-plugins; 
      motherboard = "amd"; 
      server.port = 6742; 
    };
  };
}

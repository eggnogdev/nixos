{ config, lib, pkgs, ... }:

let
  cfg = config.programs.selfhosted.invidious;
in
{
  options = {
    programs.selfhosted.invidious = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Invidious";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.invidious = {
      enable = true;
      port = 5468;
      address = "0.0.0.0";
    };
  };
}

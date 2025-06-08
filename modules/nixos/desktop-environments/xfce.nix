{ config, lib, pkgs, ... }:

let
  cfg = config.system.desktopEnvironment.xfce;
in
{
  options = {
    system.desktopEnvironment.xfce = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable XFCE Desktop Environment";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };

    services.displayManager.defaultSession = "xfce";
  };
}

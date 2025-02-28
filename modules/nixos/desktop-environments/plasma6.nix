{ config, lib, pkgs, ... }:

let
  cfg = config.system.desktopEnvironment.plasma5;
in
{
  options = {
    system.desktopEnvironment.plasma5 = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Plasma6 Desktop Environment";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager = {
      defaultSession = "plasmax11";
      sddm.enable = true;
    };

    services.desktopManager.plasma6.enable = true;
  };
}

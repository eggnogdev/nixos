{ config, lib, pkgs, ... }:

let
  cfg = config.programs.infosec.clamav;
in
{
  options = {
    programs.infosec.clamav = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable ClamAV";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      clamav
    ];

    services.clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };
}

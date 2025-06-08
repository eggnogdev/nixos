{ config, lib, pkgs, ... }:

let
  cfg = config.programs.communication.threema;
in
{
  options = {
    programs.communication.threema = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Threema Desktop";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      threema-desktop
    ];
  };
}

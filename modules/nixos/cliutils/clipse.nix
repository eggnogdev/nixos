{ config, lib, pkgs, ... }:

let
  cfg = config.programs.cliutils.clipse;
in
{
  options = {
    programs.cliutils.clipse = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Clipse";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      clipse
    ];
  };
}

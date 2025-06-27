{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.syncplay;
in
{
  options = {
    programs.utils.syncplay = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Syncplay";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      syncplay
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.cpu-x;
in
{
  options = {
    programs.utils.cpu-x = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable CPU-X";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cpu-x
    ];
  };
}

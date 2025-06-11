{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.lshw;
in
{
  options = {
    programs.utils.lshw = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable lshw";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lshw
    ];
  };
}

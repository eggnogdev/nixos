{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.btop;
in
{
  options = {
    programs.hwutils.btop = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable btop";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}

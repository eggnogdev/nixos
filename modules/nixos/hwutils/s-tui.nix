{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.s-tui;
in
{
  options = {
    programs.hwutils.s-tui = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable s-tui";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      s-tui
    ];
  };
}

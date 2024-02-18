{ config, lib, pkgs, ... }:

let
  cfg = config.programs.sublime;
in
{
  options = {
    programs.sublime = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable sublime text editor";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.sublime4 ];
  };
}
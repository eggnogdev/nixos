{ config, lib, pkgs, ... }:

let
  cfg = config.programs.sublime;

  userDir = "${config.xdg.configHome}/sublime-text/Packages/User";
in
{
  options = {
    programs.sublime = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable sublime text editor";
      };

      preferences = lib.mkOption {
        default = {};
        description = "Sublime Text Preferences.sublime-settings";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.sublime4 ];
  };
}
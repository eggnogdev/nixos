{ config, lib, ... }:

let
  cfg = config.programs.developer.alacritty;
in
{
  options = {
    programs.developer.alacritty = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Alacritty";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.normal.family = "FantasqueSansM Nerd Font";
        font.size = 16;
      };

      # theme = "Mariana";
      settings = {
        colors = {
          primary = {
            background = "0x293038";
            foreground = "0xcbd3e2";
          };

          normal = {
            black = "0x252b32";
            red = "0xec5f66";
            green = "0x99c794";
            yellow = "0xfac761";
            blue = "0x6699cc";
            magenta = "0xc695c6";
            cyan = "0x5fb4b4";
            white = "0xffffff";
          };

          bright = {
            black = "0x252b32";
            red = "0xec5f66";
            green = "0x99c794";
            yellow = "0xfac761";
            blue = "0x6699cc";
            magenta = "0xc695c6";
            cyan = "0x5fb4b4";
            white = "0xffffff";
          };
        };
      };
    };
  };
}

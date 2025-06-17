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
    };
  };
}

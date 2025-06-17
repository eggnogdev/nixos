{ config, lib, pkgs, ... }:

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
    environment.systemPackages = with pkgs; [
      alacritty
    ];
  };
}

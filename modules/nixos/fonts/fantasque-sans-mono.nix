{ config, lib, pkgs, ... }:

let
  cfg = config.fonts.fantasque-sans-mono;
in
{
  options = {
    fonts.fantasque-sans-mono = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Fantasque Sans Mono font";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.fantasque-sans-mono
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.audio.kasts;
in
{
  options = {
    programs.audio.kasts = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable KDE Kasts";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kdePackages.kasts
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.audio.gnome-podcasts;
in
{
  options = {
    programs.audio.gnome-podcasts = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable GNOME Podcasts";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome-podcasts
    ];
  };
}

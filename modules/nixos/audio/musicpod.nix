{ config, lib, pkgs, ... }:

let
  cfg = config.programs.audio.musicpod;
in
{
  options = {
    programs.audio.musicpod = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable MusicPod";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      musicpod
    ];
  };
}

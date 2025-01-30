{ config, lib, pkgs, ... }:

let
  cfg = config.programs.education.anki;
in
{
  options = {
    programs.education.anki = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Anki";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      anki
    ];
  };
}

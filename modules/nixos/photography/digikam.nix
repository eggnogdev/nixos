{ config, lib, pkgs, ... }:

let
  cfg = config.programs.photography.digikam;
in
{
  options = {
    programs.photography.digikam = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable digikam";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      digikam
    ];
  };
}

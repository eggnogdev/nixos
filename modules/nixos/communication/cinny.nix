{ config, lib, pkgs, ... }:

let
  cfg = config.programs.communication.cinny;
in
{
  options = {
    programs.communication.cinny = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Cinny";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cinny-desktop
    ];
  };
}

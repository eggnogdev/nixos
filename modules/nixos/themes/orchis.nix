{ config, lib, pkgs, ... }:

let
  cfg = config.appearance.theme.orchis;
in
{
  options = {
    appearance.theme.orchis = {
      enable = lib.mkOption {
        default = false;
        description = "Enable Orchis Theme";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      orchis-theme
    ];
  };
}

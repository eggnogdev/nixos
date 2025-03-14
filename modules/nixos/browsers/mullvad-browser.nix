{ config, lib, pkgs, ... }:

let
  cfg = config.programs.browsers.mullvad-browser;
in
{
  options = {
    programs.browsers.mullvad-browser = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Mullvad Browser";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mullvad-browser
    ];
  };
}

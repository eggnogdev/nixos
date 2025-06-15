{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.solaar;
in
{
  options = {
    programs.hwutils.solaar = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Solaar";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      solaar
    ];
  };
}

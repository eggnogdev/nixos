{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.solaar;
in
{
  options = {
    programs.utils.solaar = {
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

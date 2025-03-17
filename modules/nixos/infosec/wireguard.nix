{ config, lib, pkgs, ... }:

let
  cfg = config.programs.infosec.wireguard;
in
{
  options = {
    programs.infosec.wireguard = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Wireguard";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wireguard-tools
      wireguard-ui
    ];

    networking.wireguard.enable = true;
  };
}

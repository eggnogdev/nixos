{ config, lib, pkgs, ... }:

let
  cfg = config.programs.developer.docker;
in
{
  options = {
    programs.developer.docker = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Docker";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };

      enableOnBoot = true;
    };

    environment.systemPackages = with pkgs; [
      docker
    ];
  };
}

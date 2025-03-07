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
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.developer.docker-compose;
in
{
  options = {
    programs.developer.docker-compose = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Docker Compose";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}

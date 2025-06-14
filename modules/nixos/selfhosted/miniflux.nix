{ config, lib, pkgs, ... }:

let
  cfg = config.programs.selfhosted.miniflux;
in
{
  options = {
    programs.selfhosted.miniflux = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Miniflux";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.miniflux = {
      enable = true;

      adminCredentialsFile = "/etc/miniflux/admin";

      config = {
        PORT = 27159;
      };
    };

    networking.firewall.allowedTCPPorts = [
      config.services.miniflux.config.PORT
    ];
  };
}


{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.blueman;
in
{
  options = {
    programs.utils.blueman = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Blueman";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.blueman.enable = true;
  };
}

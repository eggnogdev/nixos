{ config, lib, pkgs, ... }:

let
  cfg = config.programs.design.krita;
in
{
  options = {
    programs.design.krita = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Krita";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      krita
    ];
  };
}

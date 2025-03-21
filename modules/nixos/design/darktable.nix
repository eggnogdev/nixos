{ config, lib, pkgs, ... }:

let
  cfg = config.programs.design.darktable;
in
{
  options = {
    programs.design.darktable = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable darktable";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      darktable
    ];
  };
}

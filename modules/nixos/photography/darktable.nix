{ config, lib, pkgs, ... }:

let
  cfg = config.programs.photography.darktable;
in
{
  options = {
    programs.photography.darktable = {
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

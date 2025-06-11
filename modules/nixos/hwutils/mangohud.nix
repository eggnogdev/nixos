{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.mangohud;
in
{
  options = {
    programs.hwutils.mangohud = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable MangoHUD";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}

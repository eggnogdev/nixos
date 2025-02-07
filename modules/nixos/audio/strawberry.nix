{ config, lib, pkgs, ... }:

let
  cfg = config.programs.audio.strawberry;
in
{
  options = {
    programs.audio.strawberry = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Strawberry";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      strawberry
    ];
  };
}

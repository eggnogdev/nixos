{ config, lib, pkgs, ... }:

let
  cfg = config.programs.communication.discord;
in
{
  options = {
    programs.communication.discord = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Discord";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    
    
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.communication.simplex-chat;
in
{
  options = {
    programs.communication.simplex-chat = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable SimpleX Chat";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      simplex-chat-desktop
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.ollama;
in
{
  options = {
    programs.utils.ollama = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Ollama";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ollama
    ];
  };
}

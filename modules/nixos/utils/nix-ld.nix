{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.nix-ld;
in
{
  options = {
    programs.utils.nix-ld = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable nix-ld";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;
  };
}

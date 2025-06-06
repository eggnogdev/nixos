{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.phoronix-test-suite;
in
{
  options = {
    programs.utils.phoronix-test-suite = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Phoronix Test Suite";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      phoronix-test-suite
    ];
  };
}

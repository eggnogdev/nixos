{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hwutils.phoronix;
in
{
  options = {
    programs.hwutils.phoronix = {
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

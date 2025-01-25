{ config, lib, pkgs, ... }:

let
  cfg = config.programs.design.orca-slicer;
in
{
  options = {
    programs.design.orca-slicer = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Orca Slicer";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      orca-slicer
    ];
  };
}

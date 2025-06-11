{ config, lib, pkgs, ... }:

let
  cfg = config.programs.utils.openrgb;
  openrgb-rules = builtins.fetchurl {
    url = "https://gitlab.com/CalcProgrammer1/OpenRGB/-/raw/master/60-openrgb.rules";
  };
in
{
  options = {
    programs.utils.openrgb = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable OpenRGB";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
    services.udev.extraRules =  builtins.readFile openrgb-rules;

    environment.systemPackages = with pkgs; [
      openrgb
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.programs.communication.nheko;
in
{
  options = {
    programs.communication.nheko = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Nheko";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nheko
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "olm-3.2.16"
      "openssl-1.1.1w"
    ];
  };
}

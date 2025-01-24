{ config, lib, pkgs, nixpkgs, ... }:

let
  cfg = config.programs.developer.sublime-text;
in
{
  options = {
    programs.developer.sublime-text = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Sublime Text";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;    

    environment.systemPackages = with pkgs; [
      sublime4
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };
}

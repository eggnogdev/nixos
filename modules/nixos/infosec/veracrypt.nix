{ config, lib, pkgs, ... }:

let
	cfg = config.programs.infosec.veracrypt;
in
{
	options = {
		programs.infosec.veracrypt = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Veracrypt";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			veracrypt
		];

		nixpkgs.config.allowUnfree = true;
	};
}

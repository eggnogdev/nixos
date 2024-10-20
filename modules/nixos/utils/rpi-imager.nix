{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.rpi-imager;
in
{
	options = {
		programs.utils.rpi-imager = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Raspberry Pi Imager";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			rpi-imager
		];
	};
}

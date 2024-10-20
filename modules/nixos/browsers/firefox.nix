{ config, lib, pkgs, ... }:

let
 cfg = config.programs.browsers.firefox;
in
{
	options = {
		programs.browsers.firefox = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Firefox";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		programs.firefox.enable = true;
	};
}
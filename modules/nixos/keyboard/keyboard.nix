{ config, lib, pkgs, ... }:

let
	cfg = config.system.keyboard;
in
{
	options = {
		system.keyboard = {
			layout = lib.mkOption {
				type = lib.types.str;
				default = "us";
				description = "Keyboard layout";
				example = "us";
			};

			variant = lib.mkOption {
				type = lib.types.str;
				default = "us";
				description = "Keyboard layout variant";
				example = "dvorak";
			};
		};
	};

	config =  {
		services.xserver.xkb = {
			layout = cfg.layout;
			variant = cfg.variant;
		};

		console.keyMap = cfg.variant;
	};
}

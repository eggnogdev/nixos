{ config, lib, pkgs, ... }:

let
	cfg = config.system.desktopEnvironment.plasma5;
in
{
	options = {
		system.desktopEnvironment.plasma5 = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Plasma5 Desktop Environment";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		services.xserver = {
			enable = true;
			desktopManager.plasma5.enable = true;
		};

		services.displayManager.sddm.enable = true;
	};
}

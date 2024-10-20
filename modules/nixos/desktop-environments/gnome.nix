{ config, lib, pkgs, ... }:

let
	cfg = config.system.desktopEnvironment.gnome;
in
{
	options = {
		system.desktopEnvironment.gnome = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable GNOME Desktop Environment";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		services.xserver = {
			enable = true;
			displayManager.gdm = {
				enable = true;
				wayland = false;
			};
			desktopManager.gnome.enable = true;
		};
	};
}

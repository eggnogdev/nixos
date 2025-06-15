{ config, lib, pkgs, ... }:

let
	cfg = config.programs.hwutils.gnomediskutil;
in
{
	options = {
		programs.hwutils.gnomediskutil = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable GNOME Disk Utility";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			gnome-disk-utility
		];
	};
}

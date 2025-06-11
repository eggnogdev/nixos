{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.gnomediskutil;
in
{
	options = {
		programs.utils.gnomediskutil = {
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

{ config, lib, pkgs, ... }:

let
	cfg = config.programs.browsers.chromium;
in
{
	options = {
		programs.browsers.chromium = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Chromium";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			chromium
		];
	};
}
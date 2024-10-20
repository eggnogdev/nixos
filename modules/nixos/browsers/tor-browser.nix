{ config, lib, pkgs, ... }:

let
	cfg = config.programs.browsers.tor-browser;
in
{
	options = {
		programs.browsers.tor-browser = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Tor Browser";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			tor-browser
		];
	};
}

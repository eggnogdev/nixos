{ config, lib, pkgs, ... }:

let
	cfg = config.programs.devutils.mongodb-compass;
in
{
	options = {
		programs.devutils.mongodb-compass = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable MongoDB Compass";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			mongodb-compass
		];
	};
}

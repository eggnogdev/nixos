{ config, lib, pkgs, ... }:

let
	cfg = config.programs.cliutils.exiftool;
in
{
	options = {
		programs.cliutils.exiftool = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable exiftool";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			exiftool
		];
	};
}

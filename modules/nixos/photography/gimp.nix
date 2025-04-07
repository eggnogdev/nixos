{ config, lib, pkgs, ... }:

let
	cfg = config.programs.photography.gimp;
in
{
	options = {
		programs.photography.gimp = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable GIMP";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			gimp
		];
	};
}

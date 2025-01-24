{ config, lib, pkgs, ... }:

let
	cfg = config.programs.design.gimp;
in
{
	options = {
		programs.design.gimp = {
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

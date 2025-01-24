{ config, lib, pkgs, ... }:

let
	cfg = config.programs.design.freecad;
in
{
	options = {
		programs.design.freecad = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable FreeCAD";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			freecad
		];
	};
}

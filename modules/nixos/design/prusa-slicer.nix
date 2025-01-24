{ config, lib, pkgs, ... }:

let
	cfg = config.programs.design.prusa-slicer;
in
{
	options = {
		programs.design.prusa-slicer = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Prusa Slicer";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			prusa-slicer
		];
	};
}

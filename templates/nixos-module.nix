{ config, lib, pkgs, ... }:

let
	cfg = config.programs.category.program;
in
{
	options = {
		programs.category.program = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Program";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			program
		];
	};
}

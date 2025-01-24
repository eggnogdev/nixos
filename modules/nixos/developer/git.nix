{ config, lib, pkgs, ... }:

let
	cfg = config.programs.developer.git;
in
{
	options = {
		programs.developer.git = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Git";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			git
		];
	};
}

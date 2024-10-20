{ config, lib, pkgs, ... }:

let
	cfg = config.programs.git.git;
in
{
	options = {
		programs.git.git = {
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

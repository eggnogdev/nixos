{ config, lib, pkgs, ... }:

let
	cfg = config.programs.cliutils.neofetch;
in
{
	options = {
		programs.cliutils.neofetch = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable neofetch";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			neofetch
		];
	};
}

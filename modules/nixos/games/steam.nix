{ config, lib, pkgs, ... }:

let
	cfg = config.programs.games.steam;
in
{
	options = {
		programs.games.steam = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Steam";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			steam
		];
	};
}

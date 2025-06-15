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
		programs.steam = {
			enable = true;
			gamescopeSession.enable = true;
		};

		programs.gamemode.enable = true;

		environment.systemPackages = with pkgs; [
			protonup
		];

		environment.sessionVariables = {
			STEAM_EXTRA_COMPAT_TOOLS_PATH =
				"\${HOME}/.steam/root/compatibilitytools.d";
		};
	};
}

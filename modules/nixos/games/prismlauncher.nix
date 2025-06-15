{ config, lib, pkgs, ... }:

let
	cfg = config.programs.games.prismlauncher;
in
{
	options = {
		programs.games.prismlauncher = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Prism Launcher";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			prismlauncher
		];

		programs.gamemode.enable = true;
	};
}

{ config, lib, pkgs, ... }:

let
	cfg = config.programs.shells.bash;
in
{
	options = {
		programs.shells.bash = {
			aliases = lib.mkOption {
				default = {};
				description = "Shell aliases";
			};
		};
	};

	config = {
		programs.bash = {
			shellAliases = cfg.aliases;
		};
	};
}

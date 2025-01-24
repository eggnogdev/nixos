{ config, lib, pkgs, ... }:

let
	cfg = config.programs.cliutils.tree;
in
{
	options = {
		programs.cliutils.tree = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable tree";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			tree
		];
	};
}

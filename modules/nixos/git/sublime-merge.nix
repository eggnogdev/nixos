{ config, lib, pkgs, ... }:

let
	cfg = config.programs.git.sublime-merge;
in
{
	options = {
		programs.git.sublime-merge = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Sublime Merge";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			sublime-merge
		];
	};
}

{ config, lib, pkgs, ... }:

let
	cfg = config.programs.developer.sublime-merge;
in
{
	options = {
		programs.developer.sublime-merge = {
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

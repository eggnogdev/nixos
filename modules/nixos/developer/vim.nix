{ config, lib, pkgs, ... }:

let
	cfg = config.programs.developer.vim;
in
{
	options = {
		programs.developer.vim = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable vim";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			vim
		];
	};
}

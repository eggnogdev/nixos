{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.vlc;
in
{
	options = {
		programs.utils.vlc = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable VLC Media Player";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			vlc
		];
	};
}

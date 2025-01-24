{ config, lib, pkgs, ... }:

let
	cfg = config.programs.video.vlc;
in
{
	options = {
		programs.video.vlc = {
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

{ config, lib, pkgs, ... }:

let
	cfg = config.programs.video.obs-studio;
in
{
	options = {
		programs.video.obs-studio= {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable OBS Studio";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			obs-studio
		];
	};
}

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
		# following few declarations for virtual camera support
	  boot.extraModulePackages = with config.boot.kernelPackages; [
	    v4l2loopback
	  ];

	  boot.extraModprobeConfig = ''
	    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
	  '';

	  security.polkit.enable = true;

		environment.systemPackages = with pkgs; [
			obs-studio
		];
	};
}

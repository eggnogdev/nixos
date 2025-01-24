{ config, lib, pkgs, ... }:

let
	cfg = config.programs.developer.android-studio;
in
{
	options = {
		programs.developer.android-studio = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Android Studio";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			android-studio
		];
	};
}

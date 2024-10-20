{ config, lib, pkgs, ... }:

let
	cfg = config.programs.texteditors.android-studio;
in
{
	options = {
		programs.texteditors.android-studio = {
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

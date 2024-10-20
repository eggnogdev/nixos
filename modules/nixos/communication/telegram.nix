{ config, lib, pkgs, ... }:

let
	cfg = config.programs.communication.telegram;
in
{
	options = {
		programs.communication.telegram = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Telegram Desktop";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			telegram-desktop
		];
	};
}

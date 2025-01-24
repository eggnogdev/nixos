{ config, lib, pkgs, ... }:

let
	cfg = config.programs.communication.signal;
in
{
	options = {
		programs.communication.signal = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Signal Desktop";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			signal-desktop
		];
	};
}

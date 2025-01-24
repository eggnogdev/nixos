{ config, lib, pkgs, ... }:

let
	cfg = config.programs.infosec.keepassxc;
in
{
	options = {
		programs.infosec.keepassxc = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable KeePassXC";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			keepassxc
		];
	};
}

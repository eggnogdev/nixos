{ config, lib, pkgs, ... }:

let
	cfg = config.programs.office.protonmail;
in
{
	options = {
		programs.office.protonmail = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable ProtonMail Desktop";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			protonmail-desktop
		];
	};
}

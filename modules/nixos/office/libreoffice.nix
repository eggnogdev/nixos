{ config, lib, pkgs, ... }:

let
	cfg = config.programs.office.libreoffice;
in
{
	options = {
		programs.office.libreoffice = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable LibreOffice";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			libreoffice
		];
	};
}

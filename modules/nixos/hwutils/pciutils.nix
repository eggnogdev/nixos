{ config, lib, pkgs, ... }:

let
	cfg = config.programs.hwutils.pciutils;
in
{
	options = {
		programs.hwutils.pciutils = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable pciutils";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			pciutils
		];
	};
}

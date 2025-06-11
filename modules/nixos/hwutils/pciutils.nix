{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.pciutils;
in
{
	options = {
		programs.utils.pciutils = {
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

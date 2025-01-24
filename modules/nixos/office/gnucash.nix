{ config, lib, pkgs, ... }:

let
	cfg = config.programs.office.gnucash;
in
{
	options = {
		programs.office.gnucash = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable GnuCash";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			gnucash
		];
	};
}

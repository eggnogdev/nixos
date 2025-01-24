{ config, lib, pkgs, ... }:

let
	cfg = config.programs.office.anytype;
in
{
	options = {
		programs.office.anytype = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Anytype";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			anytype
		];
	};
}

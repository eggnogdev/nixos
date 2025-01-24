{ config, lib, pkgs, ... }:

let
	cfg = config.programs.office.thunderbird;
in
{
	options = {
		programs.office.thunderbird = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Thunderbird";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			thunderbird
		];
	};
}

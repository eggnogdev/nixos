{ config, lib, pkgs, ... }:

let
	cfg = config.programs.cliutils.wget;
in
{
	options = {
		programs.cliutils.wget = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable wget";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			wget
		];
	};
}

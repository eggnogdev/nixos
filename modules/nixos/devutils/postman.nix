{ config, lib, pkgs, ... }:

let
	cfg = config.programs.devutils.postman;
in
{
	options = {
		programs.devutils.postman = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Postman";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			postman
		];
	};
}

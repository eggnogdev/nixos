{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.xclicker;
in
{
	options = {
		programs.utils.xclicker = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable xclicker";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			xclicker
		];
	};
}

{ config, lib, pkgs, ... }:

let
	cfg = config.programs.texteditors.vscodium;
in
{
	options = {
		programs.texteditors.vscodium = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable VSCodium";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			vscodium
		];
	};
}

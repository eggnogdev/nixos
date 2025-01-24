{ config, lib, pkgs, ... }:

let
	cfg = config.programs.infosec.protonvpn;
in
{
	options = {
		programs.infosec.protonvpn = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable ProtonVPN GUI";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			protonvpn-gui
		];
	};
}

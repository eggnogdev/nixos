{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.qbittorrent;
in
{
	options = {
		programs.utils.qbittorrent = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable qbittorrent";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			qbittorrent
		];
	};
}

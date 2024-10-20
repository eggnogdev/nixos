{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.keychain;
in
{
	options = {
		programs.utils.keychain = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable Keychain";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			keychain
		];
	};
}

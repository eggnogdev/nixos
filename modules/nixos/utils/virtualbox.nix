{ config, lib, pkgs, ... }:

let
	cfg = config.programs.utils.virtualbox;
in
{
	options = {
		programs.utils.virtualbox = {
			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
				description = "Enable VirtualBox";
			};

			authorizedUsers = lib.mkOption {
				type = lib.types.listOf lib.types.str;
				default = [];
				description = "List of users authorized to use VirtualBox";
			};
		};
	};

	config = lib.mkIf cfg.enable {
		boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
		
		virtualisation.virtualbox = {
			host.enable = true;
			guest.enable = true;
		};

		users.extraGroups.vboxusers.members = cfg.authorizedUsers;
	};
}

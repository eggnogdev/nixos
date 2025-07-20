{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nixos-modules.nix
    ];

  boot.loader = {
    grub.enable = false;
    generic-extlinux-compatible.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };

  networking = {
    hostName = "radar";

    firewall = {
      enable = true;
    };

    # wireguard VPN configurations
    wg-quick.interfaces = {
      # ProtonVPN IS#10
      is-10 = {
        autostart = true;
        configFile = "/etc/wireguard/IS-10.conf";
      };
    };
  };

  # Default to UTC
  time.timeZone = null;

  users.users.admin = {
    isNormalUser = true;
    initialPassword = "123";
    description = "admin";
    home = "/home/admin";
    shell = pkgs.bash;
    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA58fo+UIk3X4ZcgDGic6AVn+xnOZxlV1mI2PJQ84M7A"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILNs0bmqPxLC4JucTn+d/z4uqTr0QYaDMyoiWlPwEUrf"
    ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.vsftpd = {
    enable = true;
    anonymousUser = true;
    anonymousMkdirEnable = true;
    anonymousUploadEnable = true;
    anonymousUserHome = "/home/ftp";
    writeEnable = true;
    extraConfig = ''
      pasv_min_port=56250
      pasv_max_port=56260
      hide_file=*
      dirlist_enable=NO
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [ 20 21 ];
    connectionTrackingModules = [ "ftp" ];
    allowedTCPPortRanges = [
      { from = 56250; to = 56260; }
    ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}


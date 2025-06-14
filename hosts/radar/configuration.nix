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
  };

  services.openssh.enable = true;

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


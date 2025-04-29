{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # include the results of the hardware scan.
      ./nixos-modules.nix # import all system wide configs
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd.luks.devices."luks-0edce6e9-b390-4f18-b860-f4bb1c3dc20f".device = "/dev/disk/by-uuid/0edce6e9-b390-4f18-b860-f4bb1c3dc20f";

  # create a shorter path for ssd-1
  fileSystems."/mnt/ssd-1" = {
    depends = [
      "/mnt/fc3fc225-f1cf-4b29-b131-24b88b2e433a"
    ];

    device = "/mnt/fc3fc225-f1cf-4b29-b131-24b88b2e433a";
    fsType = "none";
    options = [ "bind" ];
  };

  # create a shorter path for hdd-1
  fileSystems."/mnt/hdd-1" = {
    depends = [
      "/mnt/e981340d-830e-4508-ba3d-a00bac499cac"
    ];

    device = "/mnt/e981340d-830e-4508-ba3d-a00bac499cac";
    fsType = "none";
    options = [ "bind" ];
  };

  # bind /home to ssd-1 /home
  fileSystems."/home" = {
    depends = [
      "/mnt/ssd-1"
    ];

    device = "/mnt/ssd-1/home";
    fsType = "none";
    options = [ "bind" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };

  networking = {
    hostName = "teekannu";
    networkmanager.enable = true;

    extraHosts = 
      ''
        195.148.21.183 ff-vm-1
        192.168.1.108 lab-1
      '';

    firewall = {
      enable = true;

      # open ports for WireGuard public interface
      interfaces."public" = {
        allowedTCPPorts = [ 25565 ];
        allowedUDPPortRanges = [
          { from = 25565; to = 25565; }
        ];
      };
    };


    # wireguard VPN configurations
    wg-quick.interfaces = {
      # Personal WireGuard Network
      lan = {
        autostart = false;
        configFile = "/etc/wireguard/lan.conf";
      };

      # Public WireGuard Network (for trusted)
      public = {
        autostart = false;
        configFile = "/etc/wireguard/public.conf";
      };

      # ProtonVPN FI#13
      fi-13 = {
        autostart = true;
        configFile = "/etc/wireguard/FI-13.conf";
      };

      # ProtonVPN FI#35
      fi-35 = {
        autostart = false;
        configFile = "/etc/wireguard/FI-35.conf";
      };
    };
  };

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.logitech.wireless.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  # unfree must be allowed for nvidia
  nixpkgs.config.allowUnfree = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  nixpkgs.config.nvidia.acceptLicense = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eggnog = {
    isNormalUser = true;
    initialPassword = "123";
    description = "daniel";
    home = "/home/eggnog";
    shell = pkgs.bash;
    extraGroups = [
      "networkmanager"
      "syncthing"
      "wheel"
    ];
  };

  services.openssh.enable = true;

  services.syncthing = {
    enable = true;
    user = "syncthing";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

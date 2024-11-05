{ config, pkgs, inputs, ... }:

let
  hdd-path = "/mnt/e981340d-830e-4508-ba3d-a00bac499cac";
  ssd-path = "/mnt/fc3fc225-f1cf-4b29-b131-24b88b2e433a";
in
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
  
  boot.initrd.luks.devices."luks-0edce6e9-b390-4f18-b860-f4bb1c3dc20f".device = "/dev/disk/by-uuid/0edce6e9-b390-4f18-b860-f4bb1c3dc20f";

  security.apparmor = {
    enable = false;
    packages = with pkgs; [
      apparmor-profiles
    ];
  };

  networking.hostName = "teekannu"; 
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 25565 ];
    allowedUDPPorts = [ 25565 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
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

  networking.networkmanager.enable = true;

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

  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
    xkb.layout = "us";
    # xkb.variant = "dvorak";
  };

  services.displayManager.sddm.enable = true;

  # console.keyMap = "dvorak";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  nixpkgs.config.nvidia.acceptLicense = true;

  programs.adb.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      ll="ls -l";
      cd-ssd="cd ${ssd-path}";
      nix-flutter="nix develop /etc/nixos/flutter/";
    };
    interactiveShellInit = "";
  };

  programs.bash = {
    shellAliases = {
      ll="ls -l";
    };
  };

  programs.java.enable = true;

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  environment.systemPackages = with pkgs; [
    android-studio
    anki
    anytype
    authenticator
    cargo
    chromium
    exiftool
    firefox
    gcc
    gnome-disk-utility
    gnucash
    inkscape
    keepassxc
    keychain
    libreoffice
    monero-gui
    mongodb-compass
    neofetch
    nvidia-system-monitor-qt
    obsidian
    p2pool
    pciutils
    postman
    protonmail-desktop
    protonvpn-gui
    python3
    qbittorrent
    raven-reader
    rpi-imager
    rustc
    sublime4
    telegram-desktop
    tor-browser
    tree
    veracrypt
    vim
    vlc
    wget
    xclicker
  ];

  ###
  # INSECURE PACKAGES REMEMBER TO CHECK ON THESE AND MAKE SURE THEY AREN'T 
  # ALWAYS NECESSARY.
  ###
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" # obsidian
    "openssl-1.1.1w" # sublime4
  ];

  fonts.packages = with pkgs; [
    fantasque-sans-mono
  ];
  
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

  services.openssh.enable = true;

  services.syncthing = {
    enable = true;
    user = "syncthing";
  };

  services.xmrig = {
    enable = false;
    settings = {
      autosave = true;
      cpu = true;
      opencl = false;
      cuda = false;
      donate-level = 0;
      donate-over-proxy = 0;
      pools = [
        {
          url = "pool.supportxmr.com:443";
          user = "47k4baqP6fpSBvaW9mrfvnCWL9hm19W39TQavbwhwHdp2QHcm9cYYsX9FL77vkKNBdj9XMSbDvgGcRYWUW1QcdeWU1KsGPg";
          keepalive = true;
          tls = true;
        }
      ];
    };
  };

  home-manager.users = {
    eggnog = import ../home/eggnog.nix;
    student = import ../home/student.nix;
  };

  users.users.eggnog = {
    isNormalUser = true;
    initialPassword = "1234";
    description = "daniel";
    shell = pkgs.bash;
    extraGroups = [
      "networkmanager"
      "wheel"
      "wireshark"
      "syncthing"
      "adbusers"
    ];
    packages = with pkgs; [];
  };

  users.users.student = {
    isNormalUser = true;
    initialPassword = "1234";
    description = "student";
    shell = pkgs.fish;
    extraGroups = [ "syncthing" ];
    packages = with pkgs; [];
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  users.extraGroups.vboxusers.members = [ "eggnog" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

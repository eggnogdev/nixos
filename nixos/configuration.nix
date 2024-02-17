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

  networking.hostName = "teekannu"; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
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

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
  };

  console.keyMap = "dvorak";

  services.printing.enable = true;

  sound.enable = true;
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

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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

  programs.fish = {
    enable = true;
    shellAliases = {
      ll="ls -l";
      cd-ssd="cd ${ssd-path}";
      nix-flutter="nix develop /etc/nixos/flutter/";
    };
  };

  programs.java = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    android-studio
    bitwarden
    chromium
    firefox
    kitty
    libreoffice
    neofetch
    nvidia-system-monitor-qt
    pciutils
    protonvpn-gui
    python3
    sublime-merge
    vim
    wget
  ];

  fonts.packages = with pkgs; [
    fantasque-sans-mono
  ];
  
  services.openssh.enable = true;

  services.syncthing = {
    enable = true;
    user = "syncthing";
  };

  home-manager.users = {
    eggnog = import ../home/eggnog.nix;
    student = import ../home/student.nix;
  };

  users.users.eggnog = {
    isNormalUser = true;
    initialPassword = "1234";
    description = "daniel";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.users.student = {
    isNormalUser = true;
    initialPassword = "1234";
    description = "student";
    shell = pkgs.fish;
    extraGroups = [];
    packages = with pkgs; [];
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "student" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
